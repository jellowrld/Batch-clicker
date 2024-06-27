@echo off
set "clicking=false"
:loop
rem Check for F1 key press
nircmd sendkeypress f1
if %errorlevel% equ 1 (
    if "%clicking%"=="false" (
        echo Starting clicker...
        set "clicking=true"
    ) else (
        echo Stopping clicker...
        set "clicking=false"
    )
    timeout /t 1 /nobreak >nul
)

if "%clicking%"=="true" (
    powershell -ExecutionPolicy Bypass -File click.ps1
)

timeout /t 1 /nobreak >nul
goto loop
