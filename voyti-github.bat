@echo off
chcp 65001 >nul
title Vhod v GitHub
cd /d "%~dp0"

echo.
echo  Kod dlya GitHub - smotri NIZHE v etom okne:
echo  stroka:  ! First copy your one-time code: XXXX-XXXX
echo.
echo  Vstav kod na sayte github.com/login/device
echo.

set "GH=%ProgramFiles%\GitHub CLI\gh.exe"
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$ErrorActionPreference='SilentlyContinue'; & '%GH%' auth login --hostname github.com --git-protocol https --web; & '%GH%' auth status"

echo.
echo  Esli "Logged in" - zapusti deploy-permanent.bat
pause
