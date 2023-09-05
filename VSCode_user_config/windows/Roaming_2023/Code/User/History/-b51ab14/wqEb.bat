@ECHO OFF
REM # --------------------- #
REM # (C) 2020 madoodia.com #
REM # --------------------- #

SETLOCAL


REM # -----= Getting Inputs =---- #
set ROOT=%1

@REM  VCVARS_LOCATION: C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build
echo  %VCVARS_LOCATION%
call "%VCVARS_LOCATION%/vcvarsall.bat" x64 -vcvars_ver=14.29.30133

for %%i IN ("%ROOT%") do (
set FILE_PATH=%%~pi
set TARGET_NAME=%%~ni
)

REM # ------= Include Envs =----- #
set WIN_DIR=%~dp0
call %WIN_DIR%envVars.bat
REM # --------------------------- #

REM # --------- Common ---------- #
cd %ROOT%

if exist "build" (
    if %NEED_BUILD% equ 1 (
        rmdir /s /q "build"
    )
)

if not exist "build" ( 
    mkdir "build"
)

if exist %TARGET_NAME%.%OUTPUT_FILE_EXTENSION% (
    del %TARGET_NAME%.%OUTPUT_FILE_EXTENSION%
)

cd "%ROOT%/build"
cmake -G "NMake Makefiles" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_PREFIX_PATH=%EXTRA_PREFIX_PATH%;%Qt5_DIR% "%ROOT%"
cmake --build .

REM # --------------------------- #

REM # ---= Workspace Project =--- #
REM # --------- Release --------- #
copy %TARGET_NAME%.%OUTPUT_FILE_EXTENSION% %ROOT%
REM # --------------------------- #


cd %ROOT%
if exist "deploy" (
    echo ------------------------------------------------------------------------------------------------
    echo ------------ Copy FigmaQML.exe and glew.dll and shaders and textures to deploy folder --------------
    echo ------------------------------------------------------------------------------------------------
    call %WIN_DIR%envVars.bat
    copy FigmaQML.exe "deploy\"
    xcopy /s /y shaders "deploy\shaders\"
    xcopy /s /y textures "deploy\textures\"

    del "%ROOT%\FigmaQML.exe"
)