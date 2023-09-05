@echo off

set PLUGIN_FILEPATH=%1
set PLUGIN_EXT=%2
set FINAL_PATH=%3
set PLUGIN_NAME=%4
set UE_VERSION="51"

echo %PLUGIN_EXT%
if "%PLUGIN_EXT%" equ uplugin
(
    echo %PLUGIN_FILEPATH%
)

@REM "C:\Program Files\Epic Games\UE_5.1\Engine\Build\BatchFiles\RunUAT.bat" BuildPlugin -Plugin=%PLUGIN_FILEPATH% -Package="%FINAL_PATH%/%UE_VERSION%_%PLUGIN_NAME%" -Rocket -VS2019