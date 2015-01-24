# validate color
autoload -U colors
colors

# color definition
local GREEN=$'%{\e[1;32m%}'
local BLUE=$'%{\e[1;34m%}'
local DEFAULT=$'%{\e[1;m%}'

# prompt
PROMPT=$BLUE'[%n]%# '$WHITE
RPROMPT=$GREEN'[%~]'$WHITE
setopt transient_rprompt

case ${OSTYPE} in
  darwin*)
    # MacOS
    alias ls='ls -G'
    alias ll='ls -hi'
    ;;
  linux*)
    # Linux OS
    alias vim='/usr/local/bin/vim'
    alias gvim='/usr/local/bin/gvim'
    ;;
  cygwin*)
	# Cygwin on Windows
    export PATH=$PATH:/C/Applications/ffmpeg/bin
    alias ls="ls --color=auto --show-control-chars -I'NTUSER*' -I'ntuser*'"
    alias ll='ls -l'
    alias l='ls -CF'
    alias gvim='/cygdrive/c/Applications/vim32bit/gvim.exe'
    export OUTPUT_CHARSET=sjis
    export PATH=$PATH:/C/Dev/Python27/Scripts
    export PATH=$PATH:~/Scripts/
    export PATH=$PATH:/C/Users/nishimura/AppData/Local/Pandoc
    export PATH=$PATH:/C/Applications/vim32bit
    export CYGWIN="winsymlinks"
esac
