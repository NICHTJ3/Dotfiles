#Requires -Version 5.1
# Installs a dotsy profile on Windows without dotsy: winget packages + links.
# Symlinks need Developer Mode or an elevated shell; falls back to copying.
param(
  [Parameter(Mandatory)][string]$ProfileName,
  [switch]$SkipPackages
)

$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot

function Expand-Home($path) { $path -replace '^~', $HOME }

function Link($from, $to) {
  if (Test-Path $to) {
    $item = Get-Item $to -Force
    if ($item.LinkType -and $item.Target -contains $from) { return }
    throw "$to already exists and isn't linked to the repo. Remove or move it and re-run."
  }
  New-Item -ItemType Directory -Force (Split-Path $to) | Out-Null
  try {
    if (Test-Path $from -PathType Container) {
      New-Item -ItemType Junction -Path $to -Target $from | Out-Null
    } else {
      New-Item -ItemType SymbolicLink -Path $to -Target $from | Out-Null
    }
  } catch {
    Write-Warning "Symlink failed for $to, copying instead"
    Copy-Item $from $to -Recurse
  }
}

$profilePath = Join-Path $root "profiles\$ProfileName.profile.json"
if (-not (Test-Path $profilePath)) {
  $available = (Get-ChildItem (Join-Path $root 'profiles') -Filter *.profile.json).Name -replace '\.profile\.json$', ''
  throw "Unknown profile '$ProfileName'. Available: $($available -join ', ')"
}
$configNames = (Get-Content $profilePath -Raw | ConvertFrom-Json).configs

foreach ($name in $configNames) {
  Write-Host "==> $name"
  $config = Get-Content (Join-Path $root "configs\$name.config.json") -Raw | ConvertFrom-Json

  if (-not $SkipPackages) {
    foreach ($pkg in $config.packages) {
      winget list --id $pkg -e --accept-source-agreements | Out-Null
      if ($LASTEXITCODE -ne 0) {
        winget install --id $pkg -e --accept-package-agreements --accept-source-agreements
      }
    }
  }

  foreach ($l in $config.links) {
    $to = Expand-Home $l.to
    if ($l.glob) {
      $src = Join-Path (Join-Path $root 'configs') (Split-Path $l.from.Substring(2))
      foreach ($child in Get-ChildItem $src -Force) {
        Link $child.FullName (Join-Path $to $child.Name)
      }
    } else {
      Link (Join-Path (Join-Path $root 'configs') $l.from.Substring(2)) $to
    }
  }

  foreach ($dir in $config.directories) {
    $path = Expand-Home $dir
    if (-not (Test-Path $path)) {
      New-Item -ItemType Directory -Force $path | Out-Null
    }
  }
}

# Windows Terminal rewrites settings.json itself, so merge our tmux-style actions in
# (replacing any existing action bound to the same keys) instead of linking the file.
$wtSettings = Get-ChildItem "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal*\LocalState\settings.json" -ErrorAction SilentlyContinue | Select-Object -First 1
if ($wtSettings) {
  $mine = (Get-Content (Join-Path $root 'configs\config\windows-terminal\actions.json') -Raw | ConvertFrom-Json).actions
  $settings = Get-Content $wtSettings.FullName -Raw | ConvertFrom-Json
  $myKeys = $mine.keys
  $kept = @($settings.actions | Where-Object { $_ -and $_.keys -notin $myKeys })
  $keptBindings = @($settings.keybindings | Where-Object { $_ -and $_.keys -notin $myKeys })
  $settings.actions = @($kept + $mine)
  $settings.keybindings = $keptBindings
  Copy-Item $wtSettings.FullName "$($wtSettings.FullName).bak-$(Get-Date -Format yyyyMMddHHmmss)"
  $settings | ConvertTo-Json -Depth 20 | Set-Content $wtSettings.FullName -Encoding UTF8
}

Write-Host 'Done. Restart your shell, then run nvim to let lazy.nvim sync plugins.'
