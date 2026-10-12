<#
.SYNOPSIS
    DevPDCA Installer for Google Antigravity & Agentic Coding Assistants (v1.3.0).
.DESCRIPTION
    Installs DevPDCA as a Dual-Layer Architecture:
    - Layer 1 (Always-On Core Rule): rules/AGENTS.md (governs every turn below Agent Core)
    - Layer 2 (Deep Judgment Skill): skills/devpdca (SKILL.md, references/, evals/)
.PARAMETER Scope
    'global' (default) installs into ~/.gemini/config/plugins/devpdca for all projects.
    'project' installs into the current workspace (.agent/rules and .agent/skills/devpdca).
.EXAMPLE
    # One-liner remote installation (Global):
    irm https://raw.githubusercontent.com/mydrego-James/DevPDCA/main/install.ps1 | iex

    # One-liner remote installation (Project):
    & ([scriptblock]::Create((irm https://raw.githubusercontent.com/mydrego-James/DevPDCA/main/install.ps1))) -Scope project
    # Or:
    $env:DEVPDCA_SCOPE='project'; irm https://raw.githubusercontent.com/mydrego-James/DevPDCA/main/install.ps1 | iex

    # Local project installation:
    .\install.ps1 -Scope project
#>
[CmdletBinding()]
param (
    [ValidateSet('global', 'project')]
    [string]$Scope = $(if ($env:DEVPDCA_SCOPE) { $env:DEVPDCA_SCOPE } else { 'global' })
)

# Handle positional arguments or shorthand flags passed via scriptblock invocation
if ($args.Count -gt 0) {
    foreach ($arg in $args) {
        if ($arg -match '^(?:--?)?project$') { $Scope = 'project' }
        elseif ($arg -match '^(?:--?)?global$') { $Scope = 'global' }
    }
}

$ErrorActionPreference = 'Stop'

# Ensure consistent UTF-8 handling across different Windows locales and code pages
try {
    $OutputEncoding = [System.Text.Encoding]::UTF8
    [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
    [Console]::InputEncoding  = [System.Text.Encoding]::UTF8
} catch {}

# Helper function: Strip UTF-8 BOM if present
function Remove-Utf8Bom {
    param([string]$FilePath)
    if (Test-Path -LiteralPath $FilePath) {
        try {
            $bytes = [System.IO.File]::ReadAllBytes($FilePath)
            if ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
                $cleanBytes = New-Object byte[] ($bytes.Length - 3)
                [System.Array]::Copy($bytes, 3, $cleanBytes, 0, $cleanBytes.Length)
                [System.IO.File]::WriteAllBytes($FilePath, $cleanBytes)
            }
        } catch {}
    }
}

$repoOwner = "mydrego-James"
$repoName  = "DevPDCA"
$branch    = "main"

Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "   [+] DevPDCA Installer (v1.3.0)            " -ForegroundColor Cyan
Write-Host "   [i] Always-On Core Rule + Judgment Skill  " -ForegroundColor Cyan
Write-Host "=============================================" -ForegroundColor Cyan

# 1. Determine Source (Local repository or Remote GitHub)
$sourceDir = $null
$localRulesDir = $null
$localPluginJson = $null
$tempExtractDir = $null
$tempZip = $null

try {
    if ($PSScriptRoot -and (Test-Path -LiteralPath (Join-Path $PSScriptRoot "devpdca\SKILL.md"))) {
        Write-Host "[-] Detected local repository at: $PSScriptRoot" -ForegroundColor Gray
        $sourceDir = Join-Path $PSScriptRoot "devpdca"
        $localRulesDir = Join-Path $PSScriptRoot "rules"
        $localPluginJson = Join-Path $PSScriptRoot "plugin.json"
    } else {
        Write-Host "[+] Fetching latest DevPDCA from GitHub ($repoOwner/$repoName)..." -ForegroundColor Yellow
        $zipUrl = "https://github.com/$repoOwner/$repoName/archive/refs/heads/$branch.zip"
        
        $tempBase = [System.IO.Path]::GetTempPath()
        $randSuffix = [System.Guid]::NewGuid().ToString('N').Substring(0, 8)
        $tempZip = Join-Path $tempBase "DevPDCA-$branch-$randSuffix.zip"
        $tempExtractDir = Join-Path $tempBase "DevPDCA-extract-$randSuffix"

        # Enable TLS 1.2+ without disabling TLS 1.3
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor [System.Net.SecurityProtocolType]::Tls12
        Invoke-WebRequest -Uri $zipUrl -OutFile $tempZip -UseBasicParsing

        # Extract archive
        Expand-Archive -LiteralPath $tempZip -DestinationPath $tempExtractDir -Force
        $sourceDir = Join-Path $tempExtractDir "$repoName-$branch\devpdca"
        $localRulesDir = Join-Path $tempExtractDir "$repoName-$branch\rules"
        $localPluginJson = Join-Path $tempExtractDir "$repoName-$branch\plugin.json"
    }

    if (-not (Test-Path -LiteralPath (Join-Path $sourceDir "SKILL.md"))) {
        Write-Error "Failed to locate DevPDCA SKILL.md in source directory: $sourceDir"
        exit 1
    }

    # 2. Perform Installation based on Scope
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)

    if ($Scope -eq 'global') {
        # Determine user home directory safely across Windows configurations
        $userProfile = if ($env:USERPROFILE) { $env:USERPROFILE } elseif ($HOME) { $HOME } else { [Environment]::GetFolderPath('UserProfile') }
        $geminiConfig = Join-Path $userProfile ".gemini\config"
        $pluginDir    = Join-Path $geminiConfig "plugins\devpdca"
        $rulesDir     = Join-Path $pluginDir "rules"
        $skillDir     = Join-Path $pluginDir "skills\devpdca"
        $globalSkills = Join-Path $geminiConfig "skills\devpdca"

        Write-Host "[+] Installing DevPDCA to Global Plugin directory:" -ForegroundColor Cyan
        Write-Host "    -> $pluginDir" -ForegroundColor Gray

        # Create target directories
        if (-not (Test-Path -LiteralPath $rulesDir)) {
            New-Item -ItemType Directory -Force -Path $rulesDir | Out-Null
        }
        if (-not (Test-Path -LiteralPath $skillDir)) {
            New-Item -ItemType Directory -Force -Path $skillDir | Out-Null
        }

        # Copy Layer 1: Always-On Core Rule (rules/AGENTS.md)
        $localAgentsMd = if ($localRulesDir) { Join-Path $localRulesDir "AGENTS.md" } else { $null }
        $targetAgentsMd = Join-Path $rulesDir "AGENTS.md"
        if ($localAgentsMd -and (Test-Path -LiteralPath $localAgentsMd)) {
            Copy-Item -LiteralPath $localAgentsMd -Destination $targetAgentsMd -Force
            Remove-Utf8Bom -FilePath $targetAgentsMd
        }

        # Copy Layer 2: Skill contents (SKILL.md, references, evals) with LiteralPath safety
        Get-ChildItem -LiteralPath $sourceDir | ForEach-Object {
            Copy-Item -LiteralPath $_.FullName -Destination $skillDir -Recurse -Force
        }

        # Setup plugin.json (strictly UTF-8 without BOM)
        $pluginJsonTarget = Join-Path $pluginDir "plugin.json"
        if ($localPluginJson -and (Test-Path -LiteralPath $localPluginJson)) {
            Copy-Item -LiteralPath $localPluginJson -Destination $pluginJsonTarget -Force
            Remove-Utf8Bom -FilePath $pluginJsonTarget
        } else {
            $defaultPluginJson = @'
{
  "name": "devpdca",
  "displayName": "DevPDCA",
  "version": "1.3.0",
  "description": "The core behavioral judgment layer for AI agents: enforces an always-on mindset core and a continuous five-move judgment process between the Agent Core and Domain Skills.",
  "author": {
    "name": "mydrego-James"
  },
  "license": "Apache-2.0",
  "keywords": [
    "pdca",
    "judgment",
    "core-behavior",
    "direction-stability",
    "context-preservation",
    "software-engineering"
  ]
}
'@
            [System.IO.File]::WriteAllText($pluginJsonTarget, $defaultPluginJson, $utf8NoBom)
        }

        # Sanitize SKILL.md to ensure no BOM
        $targetSkillMd = Join-Path $skillDir "SKILL.md"
        Remove-Utf8Bom -FilePath $targetSkillMd

        # Dual-compatibility junction / link: ~/.gemini/config/skills/devpdca
        $globalSkillsParent = Join-Path $geminiConfig "skills"
        if (-not (Test-Path -LiteralPath $globalSkillsParent)) {
            New-Item -ItemType Directory -Force -Path $globalSkillsParent | Out-Null
        }

        # Clean up existing junction, broken link, or legacy directory if present
        if (Test-Path -LiteralPath $globalSkills) {
            $existing = Get-Item -LiteralPath $globalSkills -Force -ErrorAction SilentlyContinue
            if ($existing.LinkType -in @('Junction', 'SymbolicLink')) {
                $existing.Delete()
            } elseif ($existing.PSIsContainer) {
                Remove-Item -LiteralPath $globalSkills -Recurse -Force -ErrorAction SilentlyContinue
            }
        }

        # Attempt Junction creation with robust fallback
        $junctionCreated = $false
        if (-not (Test-Path -LiteralPath $globalSkills)) {
            try {
                New-Item -ItemType Junction -Path $globalSkills -Target $skillDir -ErrorAction Stop | Out-Null
                $junctionCreated = $true
            } catch {
                try {
                    cmd /c mklink /J "`"$globalSkills`"" "`"$skillDir`"" 2>&1 | Out-Null
                    if (Test-Path -LiteralPath $globalSkills) { $junctionCreated = $true }
                } catch {}
            }
        }

        if (-not $junctionCreated) {
            Write-Host "    [i] Junction creation bypassed; copying files directly for dual compatibility." -ForegroundColor Gray
            if (-not (Test-Path -LiteralPath $globalSkills)) {
                New-Item -ItemType Directory -Force -Path $globalSkills | Out-Null
            }
            Get-ChildItem -LiteralPath $skillDir | ForEach-Object {
                Copy-Item -LiteralPath $_.FullName -Destination $globalSkills -Recurse -Force
            }
        }

        Write-Host "    [OK] Layer 1 Always-On Core Rule deployed: $targetAgentsMd" -ForegroundColor Green
        Write-Host "    [OK] Layer 2 Deep Judgment Skill deployed: $skillDir" -ForegroundColor Green

        # Validate with agy CLI if available
        $agyCmd = Get-Command "agy" -ErrorAction SilentlyContinue
        if ($agyCmd) {
            Write-Host "[+] Validating plugin with Antigravity CLI (agy)..." -ForegroundColor Yellow
            $valOutput = agy plugin validate "$pluginDir" 2>&1
            if ($LASTEXITCODE -eq 0) {
                Write-Host "    [OK] agy plugin validate passed!" -ForegroundColor Green
            } else {
                Write-Host "    [!] agy validation notice: $valOutput" -ForegroundColor Yellow
            }
        }

    } else {
        # Project Scope: Current working directory
        $cwd = (Get-Location).ProviderPath
        $projectRulesDir = Join-Path $cwd ".agent\rules"
        $projectSkillDir = Join-Path $cwd ".agent\skills\devpdca"

        Write-Host "[+] Installing DevPDCA to Project directory:" -ForegroundColor Cyan
        Write-Host "    -> $projectRulesDir (Always-On Core Rule)" -ForegroundColor Gray
        Write-Host "    -> $projectSkillDir (Deep Judgment Skill)" -ForegroundColor Gray

        if (-not (Test-Path -LiteralPath $projectRulesDir)) {
            New-Item -ItemType Directory -Force -Path $projectRulesDir | Out-Null
        }
        if (-not (Test-Path -LiteralPath $projectSkillDir)) {
            New-Item -ItemType Directory -Force -Path $projectSkillDir | Out-Null
        }

        # Copy Layer 1 Always-On Core Rule
        $localAgentsMd = if ($localRulesDir) { Join-Path $localRulesDir "AGENTS.md" } else { $null }
        $targetProjectRule = Join-Path $projectRulesDir "devpdca.md"
        if ($localAgentsMd -and (Test-Path -LiteralPath $localAgentsMd)) {
            Copy-Item -LiteralPath $localAgentsMd -Destination $targetProjectRule -Force
            Remove-Utf8Bom -FilePath $targetProjectRule
        }

        # Copy Layer 2 Skill
        Get-ChildItem -LiteralPath $sourceDir | ForEach-Object {
            Copy-Item -LiteralPath $_.FullName -Destination $projectSkillDir -Recurse -Force
        }

        # Sanitize BOM on target files
        Remove-Utf8Bom -FilePath (Join-Path $projectSkillDir "SKILL.md")

        Write-Host "    [OK] Project rule & skill installed successfully." -ForegroundColor Green
    }

} finally {
    # 3. Cleanup temporary files
    if ($tempZip -and (Test-Path -LiteralPath $tempZip)) {
        Remove-Item -LiteralPath $tempZip -Force -ErrorAction SilentlyContinue
    }
    if ($tempExtractDir -and (Test-Path -LiteralPath $tempExtractDir)) {
        Remove-Item -LiteralPath $tempExtractDir -Recurse -Force -ErrorAction SilentlyContinue
    }
}

Write-Host "`n[OK] DevPDCA v1.3.0 Installation Complete!" -ForegroundColor Green
Write-Host "[i] Layer 1 (Always-On Mindset Core) + Layer 2 (Judgment Skill) are now active." -ForegroundColor Cyan
Write-Host "[i] Note: The v1.3.0 Always-On Core architecture welcomes user testing and feedback." -ForegroundColor Yellow
Write-Host "=============================================" -ForegroundColor Cyan
