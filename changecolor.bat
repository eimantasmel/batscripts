@echo off

:: Check if no argument is provided
if "%1"=="" (
    echo Please specify a color name as an argument.
    echo Usage: changecolor.bat [color name]
    echo Available colors: pink, blue, white, red, grey, orange
    exit /b
)

:: Check for cancel command
if /i "%1"=="cancel" (
    echo Color change canceled.
    exit /b
)

:: Map color names to color codes
set colorCode=
if /i "%1"=="pink" set colorCode=D7
if /i "%1"=="blue" set colorCode=1F
if /i "%1"=="white" set colorCode=F0
if /i "%1"=="red" set colorCode=C0
if /i "%1"=="grey" set colorCode=70
if /i "%1"=="orange" set colorCode=E0

:: Check if the color name is valid
if "%colorCode%"=="" (
    echo Invalid color name: %1
    echo Available colors: pink, blue, white, red, grey, orange
    exit /b
)

:: Change the CMD color
color %colorCode%
echo Color changed to %1.
