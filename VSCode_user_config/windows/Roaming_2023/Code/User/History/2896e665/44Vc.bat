@REM # -------------------- #
@REM # (C)2022 madoodia.com #
@REM # -------------------- #


@ECHO OFF

SET ROOT=%1
SET FOLDER=%2
SET FILE=%3
SET BASENAME=%4
SET PROJECT_NAME=%BASENAME%

Echo %ROOT%
Echo %FOLDER%
Echo %FILE%
Echo %BASENAME%
Echo %PROJECT_NAME%



@REM call "%VCVARS_LOCATION%/vcvarsall.bat" x64

@REM call %ROOT%/envVars.bat

@REM if exist "%ROOT%/build" (
@REM     rmdir /s /q "%ROOT%/build"
@REM )

@REM CD %ROOT%
@REM MKDIR build
@REM CD build

@REM cmake -G "NMake Makefiles" ..
@REM @REM cmake -G "Visual Studio 16 2019" ../
@REM cmake --build . --config Debug

@REM @REM CALL %ROOT%/bin/%BASENAME%.exe