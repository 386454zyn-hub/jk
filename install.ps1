$ErrorActionPreference = 'Stop'

$source = Join-Path $PSScriptRoot 'kunkun'
$target = Join-Path $HOME '.codex\pets\kunkun'

if (-not (Test-Path -LiteralPath (Join-Path $source 'pet.json'))) {
    throw "Missing pet.json in $source"
}

if (-not (Test-Path -LiteralPath (Join-Path $source 'spritesheet.webp'))) {
    throw "Missing spritesheet.webp in $source"
}

New-Item -ItemType Directory -Force -Path $target | Out-Null
Copy-Item -LiteralPath (Join-Path $source 'pet.json') -Destination (Join-Path $target 'pet.json') -Force
Copy-Item -LiteralPath (Join-Path $source 'spritesheet.webp') -Destination (Join-Path $target 'spritesheet.webp') -Force

Write-Host "Installed 堃堃 to $target"
Write-Host 'Fully quit Codex from the system tray, then restart it to reload the pet.'
