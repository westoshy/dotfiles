#----------------------------------------------------------#
# General Setting
#----------------------------------------------------------#
export PS1="\[\e[1;32m\][\u:\W]\$\[\e[00m\] "
alias octave='octave-3.8.1'
alias g++11='g++ -std=c++11'
alias clang++11='clang++ -std=c++11'

#----------------------------------------------------------#
# Linker Setting and Include Path
#----------------------------------------------------------#

### grobal link 
export LD_LIBRARY_PATH=/usr/local/lib

# specific library link

### clang3.0
export PATH=/usr/local/clang-3.0/bin:$PATH

### Shogun
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:~/shogun/src
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/include/shogun
export PYTHONPATH=$PYTHONPATH:~/Library/shogun/src/interfaces/python_static

### Eigen3
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/local/include/eigen3

### OpenCV 2.4.9

# include directories
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/local/include/opencv
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/local/include/opencv2

# Open Dynamics Library(ODE) 0.9
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/local/include/ode
export PATH=$PATH:~/Picture/textures

# Python-dev
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/include/python2.7

