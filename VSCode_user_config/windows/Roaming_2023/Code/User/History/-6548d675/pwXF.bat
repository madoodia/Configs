@ECHO OFF
REM # --------------------- #
REM # (C) 2020 madoodia.com #
REM # --------------------- #

SETLOCAL


REM # -----= Getting Inputs =---- #
set ROOT=%1

@REM  VCVARS_LOCATION: C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build
echo  %VCVARS_LOCATION%
call "%VCVARS_LOCATION%/vcvarsall.bat" x64 -vcvars_ver=14.29

@REM for %%i IN ("%ROOT%") do (
@REM set FILE_PATH=%%~pi
@REM set TARGET_NAME=%%~ni
@REM )

@REM REM # ------= Include Envs =----- #
@REM set WIN_DIR=%~dp0
@REM call %WIN_DIR%envVars.bat
@REM REM # --------------------------- #

@REM REM # --------- Common ---------- #
@REM cd %ROOT%

@REM if exist "build" (
@REM     if %NEED_BUILD% equ 1 (
@REM         rmdir /s /q "build"
@REM     )
@REM )

@REM if not exist "build" ( 
@REM     mkdir "build"
@REM )

@REM if exist %TARGET_NAME%.%OUTPUT_FILE_EXTENSION% (
@REM     del %TARGET_NAME%.%OUTPUT_FILE_EXTENSION%
@REM )

@REM cd "%ROOT%/build"

@REM cmake -G "NMake Makefiles" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_PREFIX_PATH=%EXTRA_PREFIX_PATH% "%ROOT%"
@REM cmake --build .

@REM REM # --------------------------- #

@REM REM # ---= Workspace Project =--- #
@REM REM # --------- Release --------- #
@REM copy %TARGET_NAME%.%OUTPUT_FILE_EXTENSION% %ROOT%
@REM REM # --------------------------- #


@REM cd %ROOT%
@REM if exist "deploy" (
@REM     echo ------------------------------------------------------------------------------------------------
@REM     echo ------------ Copy Zolf.exe and glew.dll and shaders and textures to deploy folder --------------
@REM     echo ------------------------------------------------------------------------------------------------
@REM     call %WIN_DIR%envVars.bat
@REM     copy Zolf.exe "deploy\"
@REM     xcopy /s /y shaders "deploy\shaders\"
@REM     xcopy /s /y textures "deploy\textures\"

@REM     del "%ROOT%\Zolf.exe"
@REM )