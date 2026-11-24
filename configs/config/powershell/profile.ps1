set-alias vi 'nvim'

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
    oh-my-posh init pwsh --config 'spaceship' | Invoke-Expression
  }
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
