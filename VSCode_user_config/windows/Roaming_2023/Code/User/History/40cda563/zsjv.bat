@REM # -------------------- #
@REM # (C)2022 madoodia.com #
@REM # -------------------- #


@ECHO OFF

SET ROOT=%1
SET FOLDER=%2
SET FILENAME=%3
SET BASENAME=%4
SET FILEDIRNAME=%5
SET PROJECT_NAME=%FILENAME%

echo ---------------------------------
echo %ROOT%
echo %FOLDER%
echo %FILENAME%
echo %BASENAME%
echo %FILEDIRNAME%
echo %PROJECT_NAME%
echo ---------------------------------

@REM @REM replacing \ character with / character in all inputs
@REM set ROOT=%ROOT:\=/%
@REM set FOLDER=%FOLDER:\=/%
@REM set FILENAME=%FILENAME:\=/%
@REM set BASENAME=%BASENAME:\=/%
@REM set FILEDIRNAME=%FILEDIRNAME:\=/%

@REM @REM tokenize string to get the parent folder containing cmakefile
@REM set nth=1
@REM for /F "tokens=1 delims=/" %%a in ("%BASENAME%") do set CMAKEFOLDER=%%a

@REM @REM setup VS developer mode
@REM call "%VCVARS_LOCATION%/vcvarsall.bat" x64

@REM call %ROOT%/envVars.bat

@REM @REM remove build folder before building the project
@REM if exist "%FILEDIRNAME%/build" (
@REM     rmdir /s /q "%FILEDIRNAME%/build"
@REM )

@REM CD %FILEDIRNAME%
@REM MKDIR build
@REM CD build

@REM cmake -G "NMake Makefiles" "%ROOT%/%CMAKEFOLDER%"
@REM @REM cmake -G "Visual Studio 16 2019" ../
@REM cmake --build . --config Debug

@REM if not exist "%ROOT%/%CMAKEFOLDER%/bin/glew32.dll" (
@REM 	xcopy /y "%ROOT%\dlls\glew32.dll" "%ROOT%/%CMAKEFOLDER%\bin\"
@REM )

@REM @REM delete extra files in bin folder
@REM CD %ROOT%/%CMAKEFOLDER%/bin
@REM del *.ilk && del *.pdb

@REM CALL %ROOT%/%CMAKEFOLDER%/bin/%PROJECT_NAME%.exe