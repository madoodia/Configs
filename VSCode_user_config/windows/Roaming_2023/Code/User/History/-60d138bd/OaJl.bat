@echo off

set PLUGIN_FILEPATH=%1
set PLUGIN_EXT=%2
set PACKAGING_PATH=%3
set PLUGIN_NAME=%4

set UE_VERSION=51
set TARGET_EXT=.uplugin
set FINAL_PATH="%PACKAGING_PATH%\UE_%UE_VERSION%_%PLUGIN_NAME%"

echo %PLUGIN_FILEPATH%
echo %PLUGIN_EXT%
echo %TARGET_EXT%
echo %PACKAGING_PATH%
echo %PLUGIN_NAME%

if %PLUGIN_EXT% == %TARGET_EXT% (
    CALL "C:\Program Files\Epic Games\UE_5.1\Engine\Build\BatchFiles\RunUAT.bat" BuildPlugin -Plugin=%PLUGIN_FILEPATH% -Package=%FINAL_PATH% -Rocket -VS2019
)