rem madoodia@gmail.com
rem ..................
@ECHO off

SET USD_HOME_DIR=%~dp0


SET PATH=%USD_HOME_DIR%bin;%USD_HOME_DIR%lib;%USD_HOME_DIR%third_party/maya/lib;%PATH%;%USD_HOME_DIR%AL_USDMaya/lib;
SET PYTHONPATH=%USD_HOME_DIR%lib/python;%USD_HOME_DIR%AL_USDMaya/lib/python;%USD_HOME_DIR%AL_USDMaya;%USD_HOME_DIR%usd-qt;%USD_HOME_DIR%Scripts;%PYTHONPATH%;

SET MAYA_PLUG_IN_PATH=%MAYA_PLUG_IN_PATH%;%USD_HOME_DIR%third_party/maya/plugin;%USD_HOME_DIR%AL_USDMaya/plugin;
SET MAYA_SCRIPT_PATH=%MAYA_SCRIPT_PATH%;%USD_HOME_DIR%third_party/maya/share/usd/plugins/usdMaya/resources
SET XBMLANGPATH=%XBMLANGPATH%;%USD_HOME_DIR%third_party/maya/share/usd/plugins/usdMaya/resources

START /b "" "C:/Program Files/Autodesk/Maya2018/bin/maya.exe" %*


