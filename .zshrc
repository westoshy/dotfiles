# autoload
autoload -U compinit; compinit
autoload colors; colors

# directory 
DOTFILESDIR=${HOME}/dotfiles
source ${DOTFILESDIR}/.zshrc.colors
cd ${HOME}


# OS setup
case ${OSTYPE} in

  darwin*)
    source ${DOTFILESDIR}/.zshrc.mac
    # alias ls='ls -G'
    # alias ll='ls -hi'
    ;;
  linux*)
    source ${DOTFILESDIR}/.zshrc.unix
    ;;
  cygwin*)
    source ${DOTFILESDIR}/.zshrc.windows
    # export PATH=$PATH:/C/Applications/ffmpeg/bin
    # alias ls="ls --color=auto --show-control-chars -I'NTUSER*' -I'ntuser*'"
    # alias ll='ls -l'
    # alias l='ls -CF'
    # alias gvim='/cygdrive/c/Applications/vim32bit/gvim.exe'
    # export OUTPUT_CHARSET=sjis
    # export PATH=$PATH:/C/Dev/Python27/Scripts
    # export PATH=$PATH:~/Scripts/
    # export PATH=$PATH:/C/Users/nishimura/AppData/Local/Pandoc
    # export PATH=$PATH:/C/Applications/vim32bit
    # export CYGWIN="winsymlinks"
esac
