@echo off

set BASE_LOCATION=D:\madoodia\sdks
set PYTHON_LOCATION=D:\madoodia\sdks
set QT_LOCATION=C:\Qt\5.15.0\msvc2019_64

set PATH=%PYTHON_LOCATION%;%PYTHON_LOCATION%\Scripts;QT_LOCATION\bin;QT_LOCATION\lib;%BASE_LOCATION%\osl_debug\bin;%BASE_LOCATION%\osl_debug\lib;%PATH%
set PYTHONPATH=%PYTHON_LOCATION%\Lib\site-packages;%BASE_LOCATION%\osl_debug\lib\python3.7;

%BASE_LOCATION%\osl_debug\build\OpenShadingLanguage\OSL.sln
