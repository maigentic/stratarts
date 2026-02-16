$ErrorActionPreference = "Stop"

$extensionName = "stratarts"
$geminiDir = "$env:USERPROFILE\.gemini"
$extensionsDir = "$geminiDir\extensions"
$targetDir = "$extensionsDir\$extensionName"

Write-Host "Installing StratArts Gemini Extension..." -ForegroundColor Cyan

# 1. Create Target Directory
if (!(Test-Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
    Write-Host "Created extension directory: $targetDir" -ForegroundColor Green
} else {
    Write-Host "Extension directory already exists: $targetDir" -ForegroundColor Yellow
}

# 2. Copy GEMINI.md
Copy-Item -Path ".\GEMINI.md" -Destination "$targetDir\GEMINI.md" -Force
Write-Host "Copied GEMINI.md system prompt." -ForegroundColor Green

# 3. Copy Skills
$skillsSource = "..\skills" 
if (Test-Path $skillsSource) {
    Copy-Item -Path $skillsSource -Destination $targetDir -Recurse -Force
    Write-Host "Copied Skills library." -ForegroundColor Green
} else {
    Write-Error "Could not find skills folder at $skillsSource. Please run this from the extension-preflight directory."
}

# 4. Copy Templates
$templatesSource = "..\html-templates"
if (Test-Path $templatesSource) {
    Copy-Item -Path $templatesSource -Destination $targetDir -Recurse -Force
    Write-Host "Copied HTML Templates." -ForegroundColor Green
} else {
    Write-Error "Could not find html-templates folder at $templatesSource."
}

Write-Host "`nInstallation Complete!" -ForegroundColor Cyan
Write-Host "You can now use StratArts skills in any Gemini CLI session."
Write-Host "Try: 'Run the business idea validator'"
