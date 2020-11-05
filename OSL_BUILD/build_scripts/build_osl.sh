echo off

# export CURRENTDIR=%~dp0

export PATH=/usr/local/bin/cmake:/usr/local/bin/git:/usr/bin/python3.6:/usr/bin/python3.6/Scripts:$SDKS_LOCATION/Qt/5.15.0/gcc_64/bin:$SDKS_LOCATION/Qt/5.15.0/gcc_64/lib:/usr/local/bin/nasm:/opt/rh/devtoolset-7/root/bin:$PATH
export PYTHONPATH=/usr/bin/python3.6/Lib/site-packages:

export LD_LIBRARY_PATH=/opt/rh/devtoolset-7/root/usr/lib:/opt/rh/devtoolset-7/root/usr/lib64:$LD_LIBRARY_PATH


export Qt5_ROOT=$SDKS_LOCATION/Qt/5.15.0/gcc_64/lib/cmake
# export Boost_ROOT=$SDKS_LOCATION/osl/lib 

# method 2, use llvm installer
# export LLVM_ROOT=C:/LLVM/lib/cmake

clear

python build_osl.py --generator "Unix Makefiles" --osl --python --opencolorio --openimageio  -v $SDKS_LOCATION/osl_release

# python build_osl.py --generator "Unix Makefiles" --osl --debug --python --opencolorio --openimageio -v $SDKS_LOCATION/osl_debug

