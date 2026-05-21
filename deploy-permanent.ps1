# Postoyannyy hosting: GitHub Pages (besplatno)
# Odin raz: vypolnit gh auth login v brauzere, potom snova zapustit etot skript

$ErrorActionPreference = "Stop"
$root = $PSScriptRoot
Set-Location $root

$gh = "${env:ProgramFiles}\GitHub CLI\gh.exe"
if (-not (Test-Path $gh)) {
    Write-Host "Ustanovi GitHub CLI: winget install GitHub.cli"
    exit 1
}

& $gh auth status 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "=== VOYDI V GITHUB (odin raz) ==="
    Write-Host "Otkroetsya brauzer. Voydi i razreshi dostup."
    Write-Host ""
    & $gh auth login --hostname github.com --git-protocol https --web
}

if (-not (Test-Path ".git")) {
    git init
    git branch -M main
}

git add -A
git diff --cached --quiet
if ($LASTEXITCODE -ne 0) {
    git commit -m "BrainRot Heist site with SoftBrainrot download"
}

$repoName = "brainrot-heist-soft"
$owner = (& $gh api user -q .login).Trim()

& $gh repo view "$owner/$repoName" 2>$null
if ($LASTEXITCODE -ne 0) {
    & $gh repo create $repoName --public --description "SoftBrainrot cheat site for Steal a Brainrot" --source=. --remote=origin --push
} else {
    git push -u origin main
}

& $gh api "repos/$owner/$repoName/pages" -X POST -f build_type=workflow -f "source[branch]=main" 2>$null

Write-Host ""
Write-Host "=========================================="
Write-Host "  SAYT SKORO BUDET ONLAYN (1-3 minuty)"
Write-Host "  https://$owner.github.io/$repoName/"
Write-Host "=========================================="
Write-Host ""
Write-Host "Skachat: https://$owner.github.io/$repoName/downloads/SoftBrainrot.exe"
Write-Host ""
Start-Process "https://$owner.github.io/$repoName/"

# Sohranit URL
@"
https://$owner.github.io/$repoName/
Download: https://$owner.github.io/$repoName/downloads/SoftBrainrot.exe
"@ | Set-Content -Path (Join-Path $root "PUBLIC-URL.txt") -Encoding UTF8
