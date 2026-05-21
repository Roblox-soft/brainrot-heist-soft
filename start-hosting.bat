@echo off
title BrainRot Heist - hosting
cd /d "%~dp0"
echo.
echo  BrainRot Heist - zapusk sayta v internet
echo  Ne zakryvay eto okno - inache sayt vyklyuchitsya
echo.
start "serve" cmd /k npx --yes serve -l 8787 .
timeout /t 5 /nobreak >nul
start "tunnel" cmd /k npx --yes cloudflared tunnel --url http://127.0.0.1:8787
echo.
echo  Cherez 10 sek v okne tunnel poyavitsya ssylka https://....trycloudflare.com
echo  Skopiruy ee i otprav druzyam.
echo.
pause
