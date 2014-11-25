dotfiles
=================

This dotfiles are written for linux.
Windows system is not considered, but maybe works.

- Clone from github
These dotfiles are able to clone from github.

    git clone https://github.com/westoshy/dotfiles.git

- Usage
You must put the symbolic link into your home directory in order to use these
dotfiles. How to put the symbolic link is shown here.

    ln -s dotfiles/***** ~/***** (**** is dotfiles you want use)

- Describe
  - .vimrc
    This file is a main configuration of vim. 
  - .vim
    This directory contains vim plugins. Almost plugins are managed by NeoBundle
  - .gvimrc
    This file is a configuration of GUI vim.
  - .bashrc
    This file is a main configuration of bash shell.
