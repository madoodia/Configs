@echo off

set PLUGIN_FILEPATH=%1
set PLUGIN_EXT=%2
set FINAL_PATH=%3

echo %PLUGIN_EXT%
if "%PLUGIN_EXT%" equ "uplugin"
(
    echo %PLUGIN_FILEPATH%
)

@REM "C:\Program Files\Epic Games\UE_5.1\Engine\Build\BatchFiles\RunUAT.bat" BuildPlugin -Plugin=%PLUGIN_FILEPATH% -Package