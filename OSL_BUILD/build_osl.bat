cls
call "%VCVARS_LOCATION%/vcvarsall.bat" x64

python.exe build_osl.py --generator "Visual Studio 16 2019" --osl --python --ptex --openimageio --opencolorio --alembic --hdf5 --imaging -v D:/madoodia/sdks/osl
