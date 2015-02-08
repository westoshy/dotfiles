# autoload
autoload -U compinit; compinit -u
autoload colors; colors

# directory 
DOTFILESDIR=${HOME}/dotfiles
source ${DOTFILESDIR}/.zshrc.colors
cd ${HOME}

# common path
export PATH=:$PATH:~/scripts/
export PATH=:$PATH:~/scripts/install
source ~/scripts/shellfunc/shellfunc.fnc

# OS setup
case ${OSTYPE} in
  darwin*)
    source ${DOTFILESDIR}/.zshrc.mac
    ;;
  linux*)
    source ${DOTFILESDIR}/.zshrc.unix
    ;;
  cygwin*)
    source ${DOTFILESDIR}/.zshrc.windows
esac
