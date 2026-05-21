# Postoyannyy hosting: GitHub Pages (besplatno)
# Odin raz: voyti v GitHub, potom skript sam zalivet sayt

$ErrorActionPreference = "Stop"
$root = $PSScriptRoot
Set-Location $root

$gh = "${env:ProgramFiles}\GitHub CLI\gh.exe"
if (-not (Test-Path $gh)) {
    Write-Host "Ustanovi GitHub CLI: winget install GitHub.cli"
    Read-Host "Enter dlya vyhoda"
    exit 1
}

function Invoke-Gh {
    param([Parameter(ValueFromRemainingArguments = $true)][string[]]$Args)
    $old = $ErrorActionPreference
    $ErrorActionPreference = "SilentlyContinue"
    $out = & $gh @Args 2>&1
    $code = $LASTEXITCODE
    $ErrorActionPreference = $old
    return @{ Out = $out; Code = $code }
}

function Test-GhLoggedIn {
    (Invoke-Gh auth status).Code -eq 0
}

if (-not (Test-GhLoggedIn)) {
    Write-Host ""
    Write-Host "=== VOYDI V GITHUB (odin raz) ===" -ForegroundColor Cyan
    Write-Host "1. V etom okne poyavitsya KOD (XXXX-XXXX)"
    Write-Host "2. Otkroetsya brauzer - vstav kod na github.com/login/device"
    Write-Host "3. Nazhmi Authorize"
    Write-Host "4. Esli ne poluchilos - zapusti voyti-github.bat"
    Write-Host ""
    $login = Invoke-Gh auth login --hostname github.com --git-protocol https --web
    if ($login.Code -ne 0) {
        Write-Host "Vhod ne zavershen. Zapusti: voyti-github.bat" -ForegroundColor Yellow
        Read-Host "Enter dlya vyhoda"
        exit 1
    }
    if (-not (Test-GhLoggedIn)) {
        Write-Host "Vhod ne podtverzhden. Zapusti skript eshche raz." -ForegroundColor Yellow
        Read-Host "Enter dlya vyhoda"
        exit 1
    }
}

Write-Host "GitHub: OK" -ForegroundColor Green

if (-not (Test-Path ".git")) {
    git init
    git branch -M main
}

git add -A
git -c user.email="brainrot-heist@users.noreply.github.com" -c user.name="BrainRot Heist" diff --cached --quiet
if ($LASTEXITCODE -ne 0) {
    git -c user.email="brainrot-heist@users.noreply.github.com" -c user.name="BrainRot Heist" commit -m "BrainRot Heist site with SoftBrainrot download"
}

$repoName = "brainrot-heist-soft"
$userResult = Invoke-Gh api user -q .login
if ($userResult.Code -ne 0) {
    Write-Host "Ne udalos poluchit GitHub login: $($userResult.Out)"
    Read-Host "Enter dlya vyhoda"
    exit 1
}
$owner = "$($userResult.Out)".Trim()

$repoCheck = Invoke-Gh repo view "$owner/$repoName"
if ($repoCheck.Code -ne 0) {
    Write-Host "Sozdayu repozitoriy $repoName ..."
    $create = Invoke-Gh repo create $repoName --public --description "SoftBrainrot for Steal a Brainrot" --source=. --remote=origin --push
    if ($create.Code -ne 0) {
        Write-Host $create.Out
        Read-Host "Enter dlya vyhoda"
        exit 1
    }
} else {
    Write-Host "Obnovlyayu repozitoriy ..."
    git push -u origin main 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Push ne udalsya. Prover internet i prava GitHub."
        Read-Host "Enter dlya vyhoda"
        exit 1
    }
}

$null = Invoke-Gh api "repos/$owner/$repoName/pages" -X POST -f build_type=workflow
$null = Invoke-Gh workflow run "Deploy site to GitHub Pages" --repo "$owner/$repoName"

$siteUrl = "https://$owner.github.io/$repoName/"
$downloadUrl = "https://$owner.github.io/$repoName/downloads/SoftBrainrot.exe"

Write-Host ""
Write-Host "==========================================" -ForegroundColor Green
Write-Host "  SAYT SKORO BUDET ONLAYN (1-3 minuty)"
Write-Host "  $siteUrl"
Write-Host "=========================================="
Write-Host ""
Write-Host "Skachat: $downloadUrl"
Write-Host ""

@"
$siteUrl
Download: $downloadUrl
"@ | Set-Content -Path (Join-Path $root "PUBLIC-URL.txt") -Encoding UTF8

Start-Process $siteUrl
Read-Host "Gotovo. Enter dlya zakrytiya"
