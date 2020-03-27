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
# make
export PATH=/usr/local/bin:$PATH

# CMake
export PATH=/mnt/hdd/madoodia/softwares/cmake-3.17/bin:$PATH

# gcc
# export PATH=/opt/rh/devtoolset-6/root/bin/:$PATH
# USER ENVIRONMENT VARIABLES
export SDKS_LOCATION=/mnt/hdd/madoodia/sdks
export DEV_LOCATION=/mnt/hdd/madoodia/dev
export MADAPI_LOCATION=/mnt/hdd/madoodia/dev/madAPI
# GIT
# QT
# export PATH=/mnt/hdd/madoodia/softwares/Qt5.14.1/Tools/QtCreator/bin:$PATH
# export PATH=/mnt/hdd/madoodia/softwares/Qt5.14.1/5.14.1/gcc_64/bin:$PATH
# export LD_LIBRARY_PATH=/mnt/hdd/madoodia/softwares/Qt5.14.1/5.14.1/gcc_64/lib:$LD_LIBRARY_PATH
# QT_INSTALLATION_LOCATION = /mnt/hdd/madoodia/softwares/Qt5.14.1/5.14.1/gcc_64
# QT_SDK_LOCATION = /mnt/hdd/madoodia/softwares/madoodia/sdks/Qt5 -> /mnt/hdd/madoodia/softwares/Qt5.14.1/5.14.1/gcc_64

# Create symlink inside SDKS
# ln -sf /mnt/hdd/madoodia/softwares/Qt5.14.1/5.14.1/gcc_64 Qt5

# CUDA
# export PATH=/usr/local/cuda/bin:$PATH
# export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

# Extending C/C++ include path (used for building PyIlmBase)
# export C_INCLUDE_PATH=/mnt/hdd/madoodia/sdks/boost1.72/include;
# export CPLUS_INCLUDE_PATH=/mnt/hdd/madoodia/sdks/boost1.72/include;$CPLUS_INCLUDE_PATH

# nodejs
export PATH=/mnt/hdd/madoodia/sdks/nodejs-v12/bin:$PATH


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
alias gcc6='export PATH=/opt/rh/devtoolset-6/root/bin:$PATH'
alias gcc9='export PATH=/opt/rh/devtoolset-9/root/bin:$PATH'

alias code='gcc6;code'

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
alias cuda='sdks; cd CUDA'

alias qt1='export PATH=/mnt/hdd/madoodia/softwares/Qt5.14.1/Tools/QtCreator/bin:$PATH'
alias qt2='export PATH=/mnt/hdd/madoodia/softwares/Qt5.14.1/5.14.1/gcc_64/bin:$PATH'
alias qtset='qt1;qt2'
