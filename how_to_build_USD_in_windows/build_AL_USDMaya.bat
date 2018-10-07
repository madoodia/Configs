rem madoodia@gmail.com
rem ..................
@ECHO off

SET PATH=%PATH%;D:/_madoodia_/pixar_usd/USD/bin;C:/Program Files/CMake/bin;C:/Python27;C:/Program Files/Git/bin;C:/Qt/5.11.1/msvc2017_64/bin;D:/_madoodia_/pixar_usd/USD/Scripts;C:/Program Files/Autodesk/Maya2018/bin

SET QTDIR=D:/_madoodia_/pixar_usd/qt4-4.8.7-vs2013/qt-x64-shared

SET PXR_PLUGINPATH=D:/_madoodia_/pixar_usd/USD/share/usd/plugins;%PXR_PLUGINPATH%

SET MAYA_PLUG_IN_PATH=D:/_madoodia_/pixar_usd/USD/plugin;%MAYA_PLUG_IN_PATH%
SET MAYA_SCRIPT_PATH=D:/_madoodia_/pixar_usd/USD/lib:D:/_madoodia_/pixar_usd/USD/third_party/maya/share/usd/plugins/usdMaya/resources;%MAYA_SCRIPT_PATH%

SET LD_LIBRARY_PATH=D:/_madoodia_/pixar_usd/USD/lib;%LD_LIBRARY_PATH%


rem SET PYTHONPATH=D:/_madoodia_/pixar_usd/USD/site-packages;D:/_madoodia_/pixar_usd/USD/site-packages/Lib;D:/_madoodia_/pixar_usd/USD/site-packages/Lib/site-packages;D:/_madoodia_/pixar_usd/USD/Scripts;%PYTHONPATH%
SET PYTHONPATH=D:/_madoodia_/pixar_usd/USD/site-packages;D:/_madoodia_/pixar_usd/USD/Scripts;%PYTHONPATH%


START /b "" "C:/Program Files (x86)/Microsoft Visual Studio/2017/Community/VC/Auxiliary/Build/vcvarsall.bat" x64 
rem START /b "" "C:/Program Files (x86)/Microsoft Visual Studio 14.0/VC/vcvarsall.bat" x64 
