@echo off
REM ================================================
REM   Gravity Engine - Clean Build Files
REM   by Nils DONTOT
REM   https://github.com/NilsDontot/GravityEngine
REM ================================================

echo.
echo ================================================
echo   Gravity Engine - Cleanup
echo ================================================
echo.

echo Cleaning build artifacts...
echo.

REM Remove PyInstaller folders
if exist build (
    echo [INFO] Removing build/
    rmdir /s /q build
    echo [OK] build/ removed
) else (
    echo [SKIP] build/ not found
)

REM Remove spec files
if exist *.spec (
    echo [INFO] Removing .spec files
    del /q *.spec
    echo [OK] .spec files removed
) else (
    echo [SKIP] No .spec files found
)

REM Remove Python cache
if exist __pycache__ (
    echo [INFO] Removing __pycache__/
    rmdir /s /q __pycache__
    echo [OK] __pycache__/ removed
)

if exist src\__pycache__ (
    echo [INFO] Removing src/__pycache__/
    rmdir /s /q src\__pycache__
    echo [OK] src/__pycache__/ removed
)

REM Remove .pyc files
for /r %%i in (*.pyc) do (
    echo [INFO] Removing %%i
    del /q "%%i"
)

echo.
echo ================================================
echo   [SUCCESS] Cleanup complete!
echo ================================================
echo.
echo All build files have been removed.
echo You can now do a fresh build.
echo.
pause
