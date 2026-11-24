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
