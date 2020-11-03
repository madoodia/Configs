@echo off

setlocal

set PATH=C:/Windows/system32;C:/Windows;"C:/Program Files/CMake/bin";"C:/Program Files/Git/cmd";C:/Python37;C:/Python37/Scripts;C:/Qt/5.15.0/msvc2019_64/bin;C:/Qt/5.15.0/msvc2019_64/lib;C:/NASM;

set VCVARS_LOCATION="C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/VC/Auxiliary/Build"

set Qt5_ROOT=C:/Qt/5.15.0/msvc2019_64/lib/cmake
@REM set Boost_ROOT=D:/madoodia/sdks/osl/lib 

@REM method 2, use llvm installer
@REM set LLVM_ROOT=C:/LLVM/lib/cmake

cls

call %VCVARS_LOCATION%/vcvarsall.bat x64

python build_osl.py --generator "Visual Studio 16 2019" --osl --python --opencolorio --openimageio --imaging -v D:/madoodia/sdks/osl
@REM python build_osl.py --generator "Visual Studio 16 2019" --osl --python --debug --opencolorio --openimageio --imaging -v D:/madoodia/sdks/osl


endlocal



@REM echo %PATH%

@REM D:/madoodia/dev/OpenShadingLanguage/build_scripts