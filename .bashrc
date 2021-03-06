# General Settings----------------------------------------#
export PS1="\[\e[1;32m\][\u:\W]\$\[\e[00m\] "
alias octave='octave-3.8.1'
alias g++11='g++ -std=c++11'
alias clang++11='clang++ -std=c++11'

export PATH=/usr/local/SPTK/bin:$PATH

# Check Platform
if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
  OS='Cygwin'
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

if [ $OS == 'Mac' ]; then
  export TERM=xterm-color
  alias ls='ls -G'
  alias ll='ls -hi'
  alias cedit='open $1 -a /Applications/CotEditor.app'
  # if mac, "mvim" command launch MacVim(GUI mode)
fi

if [ $OS == 'Linux' ]; then
  # compiled vim
  alias vim='/usr/local/bin/vim'
  alias gvim='/usr/local/bin/gvim'
  alias open='caja .' # open current directory
  alias image='eog'
  alias ilist='geeqie'
  alias pdf='evince'
fi

if [ $OS == 'Cygwin' ]; then
  export LANG=ja_JP.utf-8
  export PATH=$PATH:/C/Applications/ffmpeg/bin
  export PATH=$PATH:/C/Dev/Python27/Scripts
  export PATH=$PATH:/C/Users/nishimura/AppData/Local/Pandoc
  export PATH=$PATH:~/scripts
  alias ls='ls --color=auto --show-control-chars --ignore={NTUSER*,ntuser*}'
  alias ll='ls -l'
  alias l='ls -CF'
  alias vim='C:/Applications/vim32bit/vim.exe'
  alias gvim='C:/Applications/vim32bit/gvim.exe'
fi

#----------------------------------------------------------#
# バイナリファイルへのパス設定
#----------------------------------------------------------#
export BUNDLER_PATH=~/Applications/Bundler
export BUNDLER_BIN_PATH=$BUNDLER_PATH/bin
export PMVS2_BIN_PATH=~/Applications/pmvs-2/program/main
export PATH=$PATH:~/scripts
export PATH=$PATH:~/binaries
export PYTHONPATH=$PATH:~/pyModule
export PYTHONPATH=$PYTHONPATH:~/pylib
export PATH=$PATH:~/binaries
export PYTHONPATH=$PYTHONPATH:~/Applications/caffe/python
export PYTHONPATH=$PYTHONPATH:/usr/local/lib
export PYTHONPATH=$PYTHONPATH:~/Downloads/Setup/VTK-6.2.0/Wrapping/Python

#----------------------------------------------------------#
# リンカの設定
#----------------------------------------------------------#

#----- local libraries link 
export LD_LIBRARY_PATH=/usr/local/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/Applications/Bundler/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/Developments/Cplusplus/publiclib/lib

#----------------------------------------------------------#
# C++インクルードパス
#----------------------------------------------------------#

#----- local libraries link
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/local/include

#----- clang 3.0
export PATH=$PATH:/usr/include/c++/4.8.2
export PATH=/usr/bin:$PATH
export PATH=$PATH:/usr/local/include

#----- Shogun
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:~/shogun/src
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/include/shogun
export PYTHONPATH=$PYTHONPATH:~/Library/shogun/src/interfaces/python_static

#----- Eigen3
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/local/include/eigen3

#----- OpenCV 2.4.9

# include directories
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/local/include/opencv
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/local/include/opencv2

# Open Dynamics Library(ODE) 0.9
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/local/include/ode
export PATH=$PATH:~/Picture/textures

# VTK-6.1
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/local/include/vtk-6.1

# qhull
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/local/include/libqhullcpp

# flann
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/local/include/flann

# PCL1.7
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/local/include/pcl-1.7

# Python-dev
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/include/python2.7

# mist
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:~/Downloads/mist-v1.6.0

# common
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:~/Developments/Cplusplus/publiclib/include
