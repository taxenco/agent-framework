#Requires -Version 5.1
<#
.SYNOPSIS
  Links this repo's agents and skills into ~/.copilot so Copilot can load them globally.
.DESCRIPTION
  Uses directory junctions (no admin rights needed). Edits in the repo apply immediately.
  Safe to re-run. Existing links are kept; real folders or files are never overwritten.
  Re-run after moving the repo, or after adding a new skill.
#>
[CmdletBinding()]
param(
    [string]$CopilotHome = (Join-Path $HOME '.copilot')
)

$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent $PSScriptRoot

function Test-Junction([string]$Path) {
    $item = Get-Item -LiteralPath $Path -Force -ErrorAction SilentlyContinue
    return $null -ne $item -and ($item.Attributes -band [IO.FileAttributes]::ReparsePoint)
}

function Set-Junction([string]$Link, [string]$Target) {
    if (Test-Path -LiteralPath $Link) {
        if (Test-Junction $Link) {
            $current = (Get-Item -LiteralPath $Link -Force).Target
            if ($current -eq $Target) { Write-Host "ok       $Link"; return }
            Write-Warning "$Link points to '$current', not '$Target'. Remove it and re-run."
            return
        }
        Write-Warning "$Link exists and is not a junction. Skipped; nothing was overwritten."
        return
    }
    New-Item -ItemType Junction -Path $Link -Target $Target | Out-Null
    Write-Host "linked   $Link -> $Target"
}

New-Item -ItemType Directory -Path $CopilotHome -Force | Out-Null

Set-Junction (Join-Path $CopilotHome 'agents') (Join-Path $repo 'agents')

$skillsHome = Join-Path $CopilotHome 'skills'
New-Item -ItemType Directory -Path $skillsHome -Force | Out-Null
Get-ChildItem -LiteralPath (Join-Path $repo 'skills') -Directory | ForEach-Object {
    Set-Junction (Join-Path $skillsHome $_.Name) $_.FullName
}

Write-Host "`nDone. Restart Copilot sessions to pick up the changes."
