@ECHO OFF
REM # --------------------- #
REM # (C) 2020 madoodia.com #
REM # --------------------- #

SETLOCAL


REM # -----= Getting Inputs =---- #
set ROOT=%1

for %%i IN ("%ROOT%") do (
set FILE_PATH=%%~pi
set TARGET_NAME=%%~ni
)

set PROJECT_NAME=%TARGET_NAME%

echo ---------------------------------------------
echo ------------ Build The project --------------
echo ---------------------------------------------
set WIN_DIR=%~dp0

cd %ROOT%
if exist "deploy" (
    rmdir /s /q "deploy"
)

@REM call %WIN_DIR%build.bat %ROOT%

cd %ROOT%
if not exist "deploy" ( 
    mkdir "deploy"
)

cd %ROOT%
echo -----------------------------------------------------------------------------------------------
echo ------------ Copy %PROJECT_NAME%.exe and glew.dlland shaders and textures to deploy folder --------------
echo -----------------------------------------------------------------------------------------------
call %WIN_DIR%envVars.bat
copy %PROJECT_NAME%.exe "deploy\"
copy "%GLEW_LOCATION%\bin\glew32.dll" "deploy\"
xcopy /s shaders "deploy\shaders\"
xcopy /s textures "deploy\textures\"

del "%ROOT%\%PROJECT_NAME%.exe"

echo --------------------------------------------------------------------
echo ------------ Deploy all needed fiels in deploy folder --------------
echo --------------------------------------------------------------------
cd "%ROOT%\deploy"
@REM Deploying all needed files beside the executable file
CALL D:\madoodia\sdks\Qt5\bin\windeployqt.exe %PROJECT_NAME%.exe --no-translations --qmldir D:\madoodia\sdks\Qt5\qml

