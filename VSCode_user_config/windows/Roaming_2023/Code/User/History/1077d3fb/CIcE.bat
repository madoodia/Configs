@REM # -------------------- #
@REM # (C)2022 madoodia.com #
@REM # -------------------- #


@ECHO OFF

SET ROOT=%1
SET FOLDER=%2
SET FILE=%3
SET BASENAME=%4
SET PROJECT_NAME=%BASENAME%

set NEED_BUILD=0

call "%VCVARS_LOCATION%/vcvarsall.bat" x64

call %ROOT%/envVars.bat

if exist "%ROOT%/build" (
    if %NEED_BUILD% equ 1 (
        rmdir /s /q "%ROOT%/build"
    )
)

CD %ROOT%
if not exist "build" ( 
    mkdir "build"
)
CD build

cmake -G "NMake Makefiles" ..
@REM cmake -G "Visual Studio 16 2019" ../
cmake --build . --config Debug

@REM CALL %ROOT%/bin/%BASENAME%.exe