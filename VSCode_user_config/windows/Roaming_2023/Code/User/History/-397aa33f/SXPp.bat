@REM # -------------------------------------- #
@REM #          (C) 2020 madoodia.com         #
@REM #           All Rights Reserved!         #
@REM # -------------------------------------- #


set NEED_BUILD=1
set OUTPUT_FILE_EXTENSION=exe
set EXTRA_PREFIX_PATH=%GLEW_LOCATION%;
set PATH=%PATH%;%GLEW_LOCATION%/bin;
set LIB=%LIB%;%OPENCL_LOCATION%/lib;
set QTVER=%Qt6_DIR%;