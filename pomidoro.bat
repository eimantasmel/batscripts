@echo off

:: Cancel option
if "%1"=="cancel" (
    echo Timer canceled.
    exit /b
)

:: Check if an argument is provided
if "%1"=="" (
    echo Please specify the number of minutes as an argument.
    echo Usage: pomidoro.bat [minutes]
    exit /b
)

:: Validate if the argument is a number
for /f "tokens=1 delims=0123456789" %%A in ("%~1") do (
    echo Error: Please provide a valid number for time in minutes.
    exit /b
)

:: Convert minutes to seconds
set /a seconds=%1*60

:: Start the timer
echo Timer set for %1 minute(s). Press CTRL+C to cancel.
timeout /t %seconds% /nobreak >nul

:: Triggers beeping sound
powershell -Command "(New-Object Media.SoundPlayer 'C:\Windows\Media\chord.wav').PlaySync()"


:: Show notification using PowerShell
powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Pomodoro Complete! Time to take a break!')"
