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

# shell function
if [ -e scripts ]; then
  source ~/MyScripts/shellfunc/shellfunc.fnc
fi

# common setup

# English->Japanese dictionary
alias up="cd ..; ls"
dic() 
{
  w3m "http://ejje.weblio.jp/content/$1" | grep "用例"
}

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
