# be aware that for osl you should install some packages with yum package manager
# like boost1.70, llvm and clang 7,8...

clear
python build_osl.py --generator "Unix Makefiles" --osl --python --ptex --openimageio --opencolorio --hdf5 --imaging -v /mnt/hdd/madoodia/sdks/osl
