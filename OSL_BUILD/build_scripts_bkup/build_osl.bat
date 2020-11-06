@echo off

@REM set CURRENTDIR=%~dp0

set PATH="C:/Program Files/CMake/bin";"C:/Program Files/Git/cmd";C:/Python37;C:/Python37/Scripts;C:/Qt/5.15.0/msvc2019_64/bin;C:/Qt/5.15.0/msvc2019_64/lib;C:/NASM;%PATH%
set PYTHONPATH=C:/Python37/Lib/site-packages;
set VCVARS_LOCATION="C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/VC/Auxiliary/Build"


set Qt5_ROOT=C:/Qt/5.15.0/msvc2019_64/lib/cmake
@REM set Boost_ROOT=D:/madoodia/sdks/osl/lib 

@REM method 2, use llvm installer
@REM set LLVM_ROOT=C:/LLVM/lib/cmake

cls

call %VCVARS_LOCATION%/vcvarsall.bat x64

python build_osl.py --generator "Visual Studio 16 2019" --osl --python --opencolorio --openimageio --imaging -v D:/madoodia/sdks/osl_release
@REM python build_osl.py --generator "Visual Studio 16 2019" --osl --debug --python --opencolorio --openimageio --imaging -v D:/madoodia/sdks/osl_debug

@REM python build_osl.py --generator "Visual Studio 16 2019" --osl --debug --notDebugAll D:/madoodia/sdks/osl/Debug




@REM @REM echo %PATH%

@REM @REM D:/madoodia/dev/OpenShadingLanguage/build_scripts

@REM @REM ...........................
@REM @REM manual building of osl with nmake
@REM cmake -DCMAKE_INSTALL_PREFIX="D:/madoodia/dev/OpenShadingLanguage/install" -DCMAKE_PREFIX_PATH="D:/madoodia/sdks/osl" -DCMAKE_BUILD_TYPE=Debug  -G "NMake Makefiles" -DUSE_PYTHON=0 -DOSL_BUILD_TESTS=0 -DCMAKE_CXX_STANDARD=14 -DLLVM_ROOT="D:/madoodia/sdks/osl" -DBoost_ROOT="D:/madoodia/sdks/osl" -DBoost_NO_BOOST_CMAKE=On -DBoost_NO_SYSTEM_PATHS=True -DCMAKE_CXX_FLAGS="/Zm150 /NODEFAULTLIB /MD /EHsc" -DENABLE_PRECOMPILED_HEADERS=OFF -DUSE_Package=OFF "D:/madoodia/dev/OpenShadingLanguage"

@REM @REM  then
@REM nmake

@REM @REM then
@REM cmake --build . --target INSTALL