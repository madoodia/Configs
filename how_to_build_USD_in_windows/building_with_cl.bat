rem madoodia@gmail.com
rem ..................
@ECHO off

rem SET PATH=%PATH%;C:/Python27;C:/Program Files/CMake/bin;C:/Qt/5.11.1/msvc2017_64/bin;C:/Qt/Tools/mingw530_32/bin;D:/_madoodia_/pixar_usd/libclang/bin;C:/Program Files/Git/bin;
SET PATH=%PATH%;C:/Python27;C:/Python27/Scripts;C:/Program Files/CMake/bin;C:/Qt/5.11.1/msvc2017_64/bin;D:/_madoodia_/pixar_usd/libclang/bin;D:/_madoodia_/pixar_usd/OpenSSL/bin;C:/Program Files/Git/bin;D:/_madoodia_/pixar_usd/nasm-2.13.03;D:/_madoodia_/pixar_usd/qt4-4.8.7-vs2013/qt-x64-shared/bin;D:/_madoodia_/pixar_usd/Scripts;C:/Program Files (x86)/Microsoft Visual Studio/2017/Community/VC/Auxiliary/Build;
rem D:/_madoodia_/pixar_usd/pyside-setup/pyside2_install/py2.7-qt5.11.1-64bit-release/bin;
SET LLVM_INSTALL_DIR=D:/_madoodia_/pixar_usd/libclang
SET QTDIR=D:/_madoodia_/pixar_usd/qt4-4.8.7-vs2013/qt-x64-shared
SET BOOST_ROOT=D:/_madoodia_/pixar_usd/boost_1_67_0


SET MAYA_INCLUDE_DIRS="C:/Program Files/Autodesk/Maya2018/include"

SET PYTHONPATH=%PYTHONPATH%;D:/_madoodia_/pixar_usd/Scripts;D:/_madoodia_/pixar_usd/site-packages;D:/_madoodia_/pixar_usd/jinja;D:/_madoodia_/pixar_usd/markupsafe;

rem START %comspec% /k "C:/Program Files (x86)/Microsoft Visual Studio/2017/Community/VC/Auxiliary/Build/vcvarsamd64_x86.bat" x64 
START /b "" "D:/Program Files (x86)/Microsoft Visual Studio/2017/Community/VC/Auxiliary/Build/vcvarsall.bat" x64 

