rem madoodia@gmail.com
rem ..................
@ECHO off

SET MAYA_RELEASE_PYTHON_GIL=1
SET PBRT_PATH=D:/madoodia/pkgs/pbrt-v3/deploy/bin/pbrt.exe
SET PBRT_RENDER_DESC_PATH=D:/madoodia/pkgs/PBRTForMaya/
SET PBRT_PLUG_IN_PATH=D:/madoodia/pkgs/PBRTForMaya/plug-ins/
rem TEMPORARY PATH for OIIO
SET OIIOTOOL_PATH=D:/madoodia/pkgs/OpenImageIO/oiiotool.exe
SET MAYA_RENDER_DESC_PATH=%MAYA_RENDER_DESC_PATH%;D:/madoodia/pkgs/PBRTForMaya/
SET MAYA_PLUG_IN_PATH=%MAYA_PLUG_IN_PATH%;D:/madoodia/pkgs/PBRTForMaya/plug-ins/

START /b "" "D:/Program Files/Autodesk/Maya2018/bin/maya.exe" %*



rem after running maya run this

rem import os
rem os.environ["MAYA_RELEASE_PYTHON_GIL"] = "1"
rem os.environ["PBRT_PATH"] = "D:/madoodia/pkgs/pbrt-v3/deploy/bin/pbrt.exe"
rem os.environ["PBRT_RENDER_DESC_PATH"] = "D:/madoodia/pkgs/PBRTForMaya/"
rem os.environ["PBRT_PLUG_IN_PATH"] = "D:/madoodia/pkgs/PBRTForMaya/plug-ins/"
rem os.environ["OIIOTOOL_PATH"] = "D:/madoodia/pkgs/OpenImageIO/oiiotool.exe"
rem os.environ["MAYA_RENDER_DESC_PATH"] += ";D:/madoodia/pkgs/PBRTForMaya"
rem os.environ["MAYA_PLUG_IN_PATH"] += ";D:/madoodia/pkgs/PBRTForMaya/plug-ins"
rem cmds.loadPlugin("PBRTForMaya.py")



rem building pbrt with CMAKE

rem first clone the repo as --recursive to include all dependencies

rem Building pbrt-v3:
rem cd build
rem cmake -DCMAKE_INSTALL_PREFIX=D:/madoodia/pkgs/mitsuba/deploy -G "Visual Studio 15 2017 Win64" -DBOOST_ROOT=D:/madoodia/USD ..

rem cmake --build . --config Release --target install