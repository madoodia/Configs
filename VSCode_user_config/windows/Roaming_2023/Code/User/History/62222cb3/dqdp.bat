@REM # -------------------- #
@REM # (C)2022 madoodia.com #
@REM # -------------------- #


@ECHO OFF

SET ROOT=%1
SET FOLDER=%2
SET FILE=%3
SET BASENAME=%4

call "%VCVARS_LOCATION%/vcvarsall.bat" x64


@REM if exist "%ROOT%/build" (
@REM     rmdir /s /q "%ROOT%/build"
@REM )

CD %ROOT%
MKDIR build
CD build

cmake -G "NMake Makefiles" ..
cmake --build . --config Debug
