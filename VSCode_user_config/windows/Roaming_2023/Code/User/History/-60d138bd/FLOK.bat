@echo off

set PLUGIN=%1
set PLUGIN_EXT=%2

echo %PLUGIN_EXT%
if %PLUGIN_EXT% equ "uplugin"
(
    echo %PLUGIN%
)

@REM "C:\Program Files\Epic Games\UE_5.1\Engine\Build\BatchFiles\RunUAT.bat" BuildPlugin -Plugin=%PLUGIN% -Package