rem madoodia@gmail.com
rem ..................
@ECHO off

SET USD_HOME_DIR=%~dp0


SET PATH=C:/Python27;%USD_HOME_DIR%bin;%USD_HOME_DIR%lib;%PATH%;
SET PYTHONPATH=%PYTHONPATH%;%USD_HOME_DIR%lib/python;%USD_HOME_DIR%site-packages;


rem usdview examples/extras/usd/tutorials/convertingLayerFormats/Sphere.usda
CMD
