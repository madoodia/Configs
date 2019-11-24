rem madoodia@gmail.com
rem ..................
@ECHO off

SET USD_HOME_DIR=%~dp0


SET PATH=%USD_HOME_DIR%bin;%USD_HOME_DIR%lib;%USD_HOME_DIR%third_party/maya/lib;%PATH%;
SET PYTHONPATH=%PYTHONPATH%;%USD_HOME_DIR%lib/python

SET MAYA_PLUG_IN_PATH=%MAYA_PLUG_IN_PATH%;%USD_HOME_DIR%third_party/maya/plugin
SET MAYA_SCRIPT_PATH=%MAYA_SCRIPT_PATH%;%USD_HOME_DIR%third_party/maya/share/usd/plugins/usdMaya/resources
SET XBMLANGPATH=%XBMLANGPATH%;%USD_HOME_DIR%third_party/maya/share/usd/plugins/usdMaya/resources

START /b "" "D:\Program Files\Autodesk\Maya2018\bin/maya.exe" %*

