@echo OFF
@REM # -------------------------------------- #
@REM #          (C) 2020 madoodia.com         #
@REM #           All Rights Reserved!         #
@REM # -------------------------------------- #


set NEED_BUILD=1
set OUTPUT_FILE_EXTENSION=exe
set EXTRA_PREFIX_PATH=%GLEW_LOCATION%;
set PATH=%PATH%;%GLEW_LOCATION%/bin;
set LIB=%LIB%;%OPENCL_LOCATION%/lib;

@REM need to set this env var to set the Qt version
set QT_VER_NUMBER=5

set QT_DIR=%%%Qt%QT_VER_NUMBER%_DIR%%%
set QTVER=Qt%QT_VER_NUMBER%