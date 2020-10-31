# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
[[ -f /etc/bashrc ]] && . /etc/bashrc


# EXPORT VARIABLES HERE
export HISTCONTROL=ignoreboth


parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="\[\033[01;32m\]\u@\h \[\033[34m\][\w]\[\033[01;33m\]\$(parse_git_branch) \[\033[30m\]<\[\$(date +%H:%M)\]>\\n\[\033[01;33m\]\$\[\033[00m\] "


# original
# PS1='\[\033[01;34m\]\u@\h\[\033[01;33m\] \W \[\033[00m\] $'
# PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] $PWD \$\[\033[00m\] '

# =---------------- PATH & LIBS --------------= #

# set LLVM_ROOT for building OSL (gave error on building osl)
export LLVM_ROOT=/opt/rh/llvm-toolset-7.0/root/usr/lib64/cmake
export PATH=/opt/rh/llvm-toolset-7.0/root/usr/bin:$PATH
export LD_LIBRARY_PATH=/opt/rh/llvm-toolset-7.0/root/usr/lib:/opt/rh/llvm-toolset-7.0/root/usr/lib64:$LD_LIBRARY_PATH

# HDF5
export HDF5_ROOT=/usr/lib64
export PATH=/usr/bin:$PATH


# Boost
export Boost_ROOT=/usr/lib64/boost169
export CPLUS_INCLUDE_PATH=/usr/include/boost169;$CPLUS_INCLUDE_PATH


# automake
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export PATH=/usr/local/bin:$PATH

# set gcc 4.8.5 as main gcc
# export PATH=/usr/bin:$PATH

# set gcc 9.3.0 as main gcc for OSL
# export PATH=/usr/local/bin:$PATH
# export LD_LIBRARY_PATH=/usr/local/lib64:$LD_LIBRARY_PATH


# make
# export PATH=/usr/local/bin:$PATH

# CMake

# set gcc devtoolset-7 as main gcc
export PATH=/opt/rh/devtoolset-7/root/bin/:$PATH
export LD_LIBRARY_PATH=/opt/rh/devtoolset-7/root/usr/lib:/opt/rh/devtoolset-7/root/usr/lib64:$LD_LIBRARY_PATH

# export PATH=/mnt/hdd/madoodia/sdks/llvm9x/tools/clang/bin/:$PATH
# USER ENVIRONMENT VARIABLES
export SFW_LOCATION=/mnt/hdd/madoodia/softwares
export SDKS_LOCATION=/mnt/hdd/madoodia/sdks
export DEV_LOCATION=/mnt/hdd/madoodia/dev
export MADAPI_LOCATION=/mnt/hdd/madoodia/dev/madAPI
# GIT
# QT (enable these three line when you want to run the built program, not for building software)

# Qt5 should be disable whenever you want to run usdview
export PATH=$SFW_LOCATION/Qt/Tools/QtCreator/bin:$PATH
export PATH=$SFW_LOCATION/Qt/Tools/QtDesignStudio/bin:$PATH
export PATH=$SFW_LOCATION/Qt/5.15.0/gcc_64/bin:$PATH
export LD_LIBRARY_PATH=$SFW_LOCATION/Qt/5.15.0/gcc_64/lib:/usr/local/lib:/usr/lib:/usr/local/lib64:/usr/lib64:/lib:/lib64:$LD_LIBRARY_PATH

export LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:/usr/local/lib64:/usr/lib64:/lib:/lib64:$LD_LIBRARY_PATH

# QT_INSTALLATION_LOCATION = /mnt/hdd/madoodia/softwares/Qt/5.15.0/gcc_64
# QT_SDK_LOCATION = /mnt/hdd/madoodia/softwares/madoodia/sdks/Qt5 -> /mnt/hdd/madoodia/softwares/Qt/5.15.0/gcc_64

# Create symlink inside SDKS
# ln -sf /mnt/hdd/madoodia/softwares/Qt/5.15.0/gcc_64 Qt5

# CUDA
# export PATH=/usr/local/cuda/bin:$PATH
# export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

# Extending C/C++ include path (used for building PyIlmBase)
# export C_INCLUDE_PATH=/mnt/hdd/madoodia/sdks/boost1.72/include;
# export CPLUS_INCLUDE_PATH=/mnt/hdd/madoodia/sdks/boost1.72/include;$CPLUS_INCLUDE_PATH

# nodejs
export PATH=/mnt/hdd/madoodia/sdks/nodejs-v12/bin:$PATH

# GammaRay
export PATH=/mnt/hdd/madoodia/softwares/GammaRay/bin:$PATH

# Houdini
# export PATH=/mnt/hdd/madoodia/softwares/hfs18.0.416/bin:$PATH
# export HFS=/mnt/hdd/madoodia/softwares/hfs18.0.416

# OSL related libraries
# boost
# export LD_LIBRARY_PATH=$SDKS_LOCATION/boost/lib:$LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=$SDKS_LOCATION/pugixml:$LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=$SDKS_LOCATION/libjpeg-turbo:$LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=$SDKS_LOCATION/zlib:$LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=$SDKS_LOCATION/IlmBase:$LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=$SDKS_LOCATION/OpenEXR/OpenEXR/lib:$LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=$SDKS_LOCATION/OpenEXR/IlmBase/lib:$LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=$SDKS_LOCATION/pybind11:$LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=/opt/libjpeg-turbo/lib64:$LD_LIBRARY_PATH
# export PATH=/usr/local/bin:$PATH
# export PATH=$SDKS_LOCATION/OpenEXR/OpenEXR/bin:$PATH

# USD
# export PYTHONPATH=$SDKS_LOCATION/USD/lib/python:$PYTHONPATH
# export PATH=$SDKS_LOCATION/USD/bin:$SDKS_LOCATION/USD/lib:$PATH



# =---------------- aliases --------------= #
# CREATE ALIASES HERE
alias ..='cd ..'
alias home='cd ~'
alias clr='clear'
alias grep='grep --color=auto'
alias ll='ls -lh'
alias la='ls -A'
alias ls='ls -h --color=auto'
alias l='ls -CF'
alias ltr='ls -ltr'
alias hg='history|grep' # hg bash
alias count='find . -type f | wc -l'
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'
alias loc='cd /usr/local/'

# alias unzip='unzip /path/to/file.zip -d /destination'


# Setup Env for GCC
# alias gcc9='export PATH=/opt/rh/devtoolset-9/root/bin:$PATH'
# alias gcc='/opt/rh/devtoolset-9/root/bin/gcc'
# alias g++='/opt/rh/devtoolset-9/root/bin/g++'
# alias code='gcc9;code'

alias cset='cd /home/reza/.config/Code/User' # contains settings.json and keybindings.json
alias vse='cd /home/reza/.vscode/extensions' # contains extension

alias rc='code ~/.bashrc'
# alias rcc='cp -r ~/.bashrc ~/dev/linux/.bashrc && code ~/dev/linux/.bashrc'
alias chr='/usr/bin/google-chrome'

# alias tree='tree -DhAN'
# alias rm='rm -fv'
alias b='cd ..'
alias bb='cd ../..'
alias bbb='cd ../../..'
alias bbbb='cd ../../../..'

alias mad='cd /mnt/hdd/madoodia'
alias dev='mad;cd dev'
alias sfw='mad;cd softwares'
alias pkgs='mad;cd pkgs'
alias sdks='mad;cd sdks'
alias sfw='mad;cd softwares'
alias dl='cd ~/Downloads'
alias mdl='cd /mnt/hdd/madoodia/_downloads'

alias paths='ls -l `pwd`/*'
alias clr='clear'

alias u='amixer -q -D pulse sset Master 10%+'
alias d='amixer -q -D pulse sset Master 10%-'

# alias ipy='ipython'

alias tmp='cd ~ && rm -rf ~/tmp && mkdir -p ~/tmp && cd ~/tmp'

# alias maya='/mnt/applications/apps/Autodesk/Maya_2017_201706020738/bin/maya'
# alias houdini='/opt/hfs17.0.459/bin/houdini'
# alias skype='/usr/bin/skypeforlinux'

alias qt='sdks; cd Qt5'
alias qtsrc='code /mnt/hdd/madoodia/softwares/Qt/5.15.0; code ../Examples;'
alias cuda='sdks; cd CUDA'

alias qt1='export PATH=/mnt/hdd/madoodia/softwares/Qt/Tools/QtCreator/bin:$PATH'
alias qt2='export PATH=/mnt/hdd/madoodia/softwares/Qt/5.15.1/gcc_64/bin:$PATH'
alias qtset='qt1;qt2'

# alias ocl='dev;code OpenCL;pkgs;code HandOnOpenCL/Exercises-Solutions;code opencl-book-samples;code CL-image-GL;sdks;code OpenCL/Samples/NVIDIAGPUComputingSDK'
# alias aby='dev;code Abyssal;code RebuildCurves;code Zolf;sfw;code Qt5.14.1/Examples/Qt-5.14.1/widgets/mainwindows;code Qt5.14.1/Examples/Qt-5.14.1/widgets/graphicsview;swf;cd /mnt/hdd/madoodia/softwares/Qt5.14.1/Examples/Qt-5.14.1/widgets/widgets;code .;dev;code codelab;'


alias automake="/usr/local/bin/automake-1.15"

alias python="/usr/bin/python3.6"
# or
# this may cause problem for yum package installer
# sudo ln -fs /usr/bin/python3.6 /usr/bin/python
# ---- and for canceling it ----
# cd /usr/bin
# sudo unlink python
# sudo ln -s python2 python
# ---- and for canceling it ----

alias pip="pip3.6"
# alias cmake="gcc9;cmake3"
# alias git="gcc9;/usr/local/bin/git"
# alias gcc="/opt/rh/devtoolset-9/root/bin/gcc"
# alias g++="/opt/rh/devtoolset-9/root/bin/g++"

alias vcp="cd /mnt/hdd/madoodia/sdks/repos/vcpkg"
