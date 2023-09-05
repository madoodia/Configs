@REM # -------------------- #
@REM # (C)2022 madoodia.com #
@REM # -------------------- #


@ECHO OFF

SET ROOT=%1
SET FOLDER=%2
SET FILE=%3
SET BASENAME=%4
SET PROJECT_NAME=Freedom

call "%VCVARS_LOCATION%/vcvarsall.bat" x64


if exist "%ROOT%/build" (
    rmdir /s /q "%ROOT%/build"
)

CD %ROOT%
MKDIR build
CD build

cmake -G "NMake Makefiles" ..
cmake --build . --config Debug
