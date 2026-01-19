@echo off
title Gravity Engine - Advanced Build
color 0A

echo ================================================
echo   Gravity Engine - Advanced Build Script
echo   by Nils DONTOT
echo ================================================
echo.
echo Select build type:
echo   1. Development (with console, faster)
echo   2. Release (no console, optimized)
echo   3. Debug (with all logs)
echo.
set /p choice="Your choice (1-3): "

if "%choice%"=="1" goto dev
if "%choice%"=="2" goto release
if "%choice%"=="3" goto debug
echo Invalid choice!
pause
exit /b 1

:dev
echo.
echo [DEV MODE] Building with console...
pyinstaller --clean ^
    --onefile ^
    --name "GravityEngine_Dev" ^
    --add-data "assets;assets" ^
    src/main.py
goto end

:release
echo.
echo [RELEASE MODE] Building optimized version...
pyinstaller --clean ^
    --onefile ^
    --noconsole ^
    --name "GravityEngine" ^
    --icon "assets/icon.ico" ^
    --add-data "assets;assets" ^
    --optimize 2 ^
    src/main.py
goto end

:debug
echo.
echo [DEBUG MODE] Building with debug info...
pyinstaller --clean ^
    --onefile ^
    --debug all ^
    --name "GravityEngine_Debug" ^
    --add-data "assets;assets" ^
    src/main.py
goto end

:end
if errorlevel 1 (
    color 0C
    echo.
    echo ================================================
    echo   BUILD FAILED!
    echo ================================================
    pause
    exit /b 1
)

color 0A
echo.
echo ================================================
echo   BUILD SUCCESSFUL!
echo ================================================
echo.
echo Output: dist\
dir /b dist\*.exe
echo.
echo Total size:
powershell -Command "'{0:N2} MB' -f ((Get-Item dist\*.exe).Length / 1MB)"
echo.
pause
