set-alias vi 'nvim'

$env:EDITOR = 'nvim'

# Vim mode for input
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -ViModeIndicator Cursor

# Make sure dotnet is on the user PATH (only written once)
$dotnet = Join-Path $HOME '.dotnet'
$userPath = [Environment]::GetEnvironmentVariable('Path', 'User')
if ((Test-Path $dotnet) -and (($userPath -split ';') -notcontains $dotnet)) {
  [Environment]::SetEnvironmentVariable('Path', "$userPath;$dotnet", 'User')
}
if (($env:Path -split ';') -notcontains $dotnet) { $env:Path += ";$dotnet" }


if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
  $ompConfig = Join-Path $HOME '.config\oh-my-posh\config.omp.json'
  if (Test-Path $ompConfig) {
    oh-my-posh init pwsh --config $ompConfig | Invoke-Expression
  } else {
    oh-my-posh init pwsh --config 'powerlevel10k_lean' | Invoke-Expression
  }
}

Import-Module PSReadLine
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -CompletionQueryItems 20
Set-PSReadLineOption -HistorySearchCaseSensitive:$false
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -HistorySaveStyle SaveIncrementally

if (-not [Console]::IsOutputRedirected -and ($env:WT_SESSION -or $env:TERM_PROGRAM -eq 'vscode' -or $env:ConEmuANSI -eq 'ON' -or $env:ANSICON)) {
  Set-PSReadLineOption -PredictionSource History
  Set-PSReadLineOption -PredictionViewStyle InlineView
}

# Git aliases (functions, since PowerShell aliases can't take arguments)
# Built-in aliases (gc, gl, gp, gcm) win over functions, so drop them first
foreach ($a in 'gc', 'gl', 'gp', 'gcm') { Remove-Item "Alias:$a" -Force -ErrorAction SilentlyContinue }

function git_main_branch {
  git rev-parse --git-dir 2>$null | Out-Null
  if ($LASTEXITCODE -ne 0) { return }
  foreach ($b in 'main', 'trunk', 'mainline', 'default', 'stable', 'master') {
    foreach ($ref in "refs/heads/$b", "refs/remotes/origin/$b", "refs/remotes/upstream/$b") {
      git show-ref -q --verify $ref 2>$null
      if ($LASTEXITCODE -eq 0) { return $b }
    }
  }
  'master'
}

$glogPretty = '%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen({0}) %C(bold blue)<%an>%Creset'

function gaa { git add . @args }
function gl { git pull @args }
function gp { git push @args }
function gc { git commit @args }
function gcm { git checkout (git_main_branch) @args }
function gco { git checkout @args }
function gcd {
  foreach ($b in 'dev', 'develop') {
    foreach ($ref in "refs/heads/$b", "refs/remotes/origin/$b") {
      git show-ref -q --verify $ref 2>$null
      if ($LASTEXITCODE -eq 0) { git checkout $b @args; return }
    }
  }
  Write-Error 'No dev or develop branch found'
}
function gcof { git checkout (git branch | fzf).Trim() }
function gss { git status --short @args }
function glo { git log --oneline --decorate @args }
function glod { git log --graph --pretty=($glogPretty -f '%ad') @args }
function glods { git log --graph --pretty=($glogPretty -f '%ad') --date=short @args }
function glog { git log --oneline --decorate --graph @args }
function glol { git log --graph --pretty=($glogPretty -f '%ar') @args }
function glola { git log --graph --pretty=($glogPretty -f '%ar') --all @args }
function glols { git log --graph --pretty=($glogPretty -f '%ar') --stat @args }

# cd aliases like zsh
function .. { Set-Location .. }
function ... { Set-Location ..\.. }

# Pretty ls
if (Get-Command lsd -ErrorAction SilentlyContinue) {
   if (Test-Path Alias:ls) { Remove-Item Alias:ls -Force }

    function ls  { lsd --group-directories-first @args }
    function l   { lsd -la --group-directories-first @args }
    function la  { lsd -lA --group-directories-first @args }
    function ll  { lsd -l --group-directories-first @args }
    function lt  { lsd --tree --depth=2 @args }
}

$EcoProfilePath = Join-Path $HOME 'Documents\PowerShell\eco-profile.ps1'
if (Test-Path -LiteralPath $EcoProfilePath) {
  . $EcoProfilePath
}

# setup 'z' to cd
if (Get-Command zoxide -ErrorAction SilentlyContinue) {
  Invoke-Expression (& { (zoxide init powershell | Out-String) })
}
