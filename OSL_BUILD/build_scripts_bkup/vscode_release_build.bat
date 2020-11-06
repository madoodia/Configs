@echo off


cd ./build_scripts

call build_osl_release.bat

call osl_release_launcher.bat
