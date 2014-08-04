#----------------------------------------------------------#
# 一般設定
#----------------------------------------------------------#
export PS1="\[\e[1;32m\][\u:\W]\$\[\e[00m\] "
alias octave='octave-3.8.1'
alias g++11='g++ -std=c++11'
alias clang++11='clang++ -std=c++11'

export PATH=/usr/local/SPTK/bin:$PATH


#----------------------------------------------------------#
# バイナリファイルへのパス設定
#----------------------------------------------------------#


#----------------------------------------------------------#
# リンカの設定
#----------------------------------------------------------#

#----- grobal link 
export LD_LIBRARY_PATH=/usr/local/lib

#----------------------------------------------------------#
# C++インクルードパス
#----------------------------------------------------------#

#----- grobal link
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/local/include

#----- clang3.0
export PATH=/usr/local/clang-3.4/bin:$PATH

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
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:~/Development/Cplusplus/include
