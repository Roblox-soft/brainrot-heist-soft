# Создаёт архив для загрузки на Netlify Drop / Cloudflare Pages
$root = $PSScriptRoot
$zip = Join-Path $root "websaite-deploy.zip"

if (Test-Path $zip) { Remove-Item $zip -Force }

$items = @(
  "index.html",
  "styles.css",
  "script.js",
  "brainrots-data.js",
  "netlify.toml",
  "_headers",
  "images",
  "downloads"
)

Compress-Archive -Path ($items | ForEach-Object { Join-Path $root $_ }) -DestinationPath $zip -Force

Write-Host "Done: $zip"
Write-Host "Size MB:" ([math]::Round((Get-Item $zip).Length / 1MB, 2))
Write-Host "Upload at https://app.netlify.com/drop"
