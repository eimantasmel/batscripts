@echo off

if "%1"=="cancel" (
    shutdown /a
    echo Shutdown have been canceled.
    exit /b
)


if "%1"=="" (
    echo Please specify the number of minutes as an argument.
    echo Usage: shutdown_after_x_minutes.bat [minutes]
    exit /b
)

set /a seconds=%1*60
echo The computer will shutdown in %1 minutes.
shutdown /s /t %seconds%
