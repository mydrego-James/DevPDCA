<#
.SYNOPSIS
    DevPDCA Installer for Google Antigravity & Agentic Coding Assistants.
.DESCRIPTION
    Installs the DevPDCA Skill into the global Antigravity environment (~/.gemini/config/plugins/devpdca)
    or into the current workspace (.agent/skills/devpdca).
.PARAMETER Scope
    'global' (default) installs for all projects on this machine.
    'project' installs into the current workspace (.agent/skills/devpdca).
.EXAMPLE
    # One-liner remote installation:
    irm https://raw.githubusercontent.com/mydrego-James/DevPDCA/main/install.ps1 | iex

    # Local project installation:
    .\install.ps1 -Scope project
#>
[CmdletBinding()]
param (
    [ValidateSet('global', 'project')]
    [string]$Scope = 'global'
)

$ErrorActionPreference = 'Stop'
try {
    [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
} catch {}

$repoOwner = "mydrego-James"
$repoName  = "DevPDCA"
$branch    = "main"

Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "   🚀 DevPDCA Installer (v1.2.0)            " -ForegroundColor Cyan
Write-Host "=============================================" -ForegroundColor Cyan

# 1. Determine Source (Local repository or Remote GitHub)
$sourceDir = $null
$tempExtractDir = $null

if ($PSScriptRoot -and (Test-Path (Join-Path $PSScriptRoot "devpdca\SKILL.md"))) {
    Write-Host "📦 Detected local repository at $PSScriptRoot" -ForegroundColor Gray
    $sourceDir = Join-Path $PSScriptRoot "devpdca"
    $localPluginJson = Join-Path $PSScriptRoot "plugin.json"
} else {
    Write-Host "🌐 Fetching latest DevPDCA from GitHub ($repoOwner/$repoName)..." -ForegroundColor Yellow
    $zipUrl = "https://github.com/$repoOwner/$repoName/archive/refs/heads/$branch.zip"
    $tempZip = Join-Path $env:TEMP "DevPDCA-$branch.zip"
    $tempExtractDir = Join-Path $env:TEMP "DevPDCA-extract-$([System.Guid]::NewGuid().ToString().Substring(0,8))"
    
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest -Uri $zipUrl -OutFile $tempZip -UseBasicParsing
    
    Expand-Archive -Path $tempZip -DestinationPath $tempExtractDir -Force
    $sourceDir = Join-Path $tempExtractDir "$repoName-$branch\devpdca"
    $localPluginJson = Join-Path $tempExtractDir "$repoName-$branch\plugin.json"
    
    Remove-Item -Path $tempZip -Force -ErrorAction SilentlyContinue
}

if (-not (Test-Path (Join-Path $sourceDir "SKILL.md"))) {
    Write-Error "Failed to locate DevPDCA SKILL.md in source directory."
}

# 2. Perform Installation based on Scope
$utf8NoBom = New-Object System.Text.UTF8Encoding $false

if ($Scope -eq 'global') {
    $geminiConfig = Join-Path $env:USERPROFILE ".gemini\config"
    $pluginDir    = Join-Path $geminiConfig "plugins\devpdca"
    $skillDir     = Join-Path $pluginDir "skills\devpdca"
    $globalSkills = Join-Path $geminiConfig "skills\devpdca"

    Write-Host "⚙️ Installing DevPDCA to Global Plugin directory:" -ForegroundColor Cyan
    Write-Host "   -> $pluginDir" -ForegroundColor Gray

    # Create directories
    if (-not (Test-Path $skillDir)) {
        New-Item -ItemType Directory -Force -Path $skillDir | Out-Null
    }

    # Copy skill contents (SKILL.md, references, evals)
    Copy-Item -Path "$sourceDir\*" -Destination $skillDir -Recurse -Force

    # Setup plugin.json
    $pluginJsonTarget = Join-Path $pluginDir "plugin.json"
    if (Test-Path $localPluginJson) {
        Copy-Item -Path $localPluginJson -Destination $pluginJsonTarget -Force
    } else {
        $defaultPluginJson = @'
{
  "name": "devpdca",
  "displayName": "DevPDCA",
  "version": "1.2.0",
  "description": "A standalone development judgment skill for AI agents with a lightweight convergence check.",
  "author": {
    "name": "mydrego-James"
  },
  "license": "Apache-2.0",
  "keywords": [
    "pdca",
    "judgment",
    "convergence",
    "verification",
    "software-engineering"
  ]
}
'@
        [System.IO.File]::WriteAllText($pluginJsonTarget, $defaultPluginJson, $utf8NoBom)
    }

    # Dual-compatibility junction: ~/.gemini/config/skills/devpdca
    $globalSkillsParent = Join-Path $geminiConfig "skills"
    if (-not (Test-Path $globalSkillsParent)) {
        New-Item -ItemType Directory -Force -Path $globalSkillsParent | Out-Null
    }
    if (-not (Test-Path $globalSkills)) {
        cmd /c mklink /J "$globalSkills" "$skillDir" | Out-Null
    }

    Write-Host "✅ Files copied successfully." -ForegroundColor Green

    # Validate with agy CLI if available
    $agyCmd = Get-Command "agy" -ErrorAction SilentlyContinue
    if ($agyCmd) {
        Write-Host "🔍 Validating plugin with Antigravity CLI (agy)..." -ForegroundColor Yellow
        $valOutput = agy plugin validate "$pluginDir" 2>&1
        if ($LASTEXITCODE -eq 0) {
            Write-Host "   ✔ agy plugin validate passed!" -ForegroundColor Green
        } else {
            Write-Host "   ⚠️ agy validation warning: $valOutput" -ForegroundColor Yellow
        }
    }

} else {
    # Project Scope: Current working directory
    $cwd = Get-Location
    $projectSkillDir = Join-Path $cwd ".agent\skills\devpdca"

    Write-Host "⚙️ Installing DevPDCA to Project directory:" -ForegroundColor Cyan
    Write-Host "   -> $projectSkillDir" -ForegroundColor Gray

    if (-not (Test-Path $projectSkillDir)) {
        New-Item -ItemType Directory -Force -Path $projectSkillDir | Out-Null
    }

    Copy-Item -Path "$sourceDir\*" -Destination $projectSkillDir -Recurse -Force
    Write-Host "✅ Project skill installed at: $projectSkillDir" -ForegroundColor Green
}

# 3. Cleanup temporary files if any
if ($tempExtractDir -and (Test-Path $tempExtractDir)) {
    Remove-Item -Path $tempExtractDir -Recurse -Force -ErrorAction SilentlyContinue
}

Write-Host "`n🎉 DevPDCA Installation Complete!" -ForegroundColor Green
Write-Host "💡 The skill will now automatically guide your agent with 'Convergence Before Consequential Action'." -ForegroundColor Cyan
Write-Host "=============================================" -ForegroundColor Cyan
