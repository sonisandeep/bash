#!/bin/bash
#

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MINGW*)     MACHINE=MinGw;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac
# echo ${MACHINE}

if [ ${MACHINE} = "Mac" ]; then
    RC_FILE=.zshrc
else
    RC_FILE=.bashrc
fi

# Configs for bashrc
if [ -f "$BASH_REPO_DIR"/prompt.sh ]; then
    . "$BASH_REPO_DIR"/prompt.sh
fi
if [ -f "$BASH_REPO_DIR"/bash_aliases.sh ]; then
    . "$BASH_REPO_DIR"/bash_aliases.sh
fi    
 
if [ -f "$BASH_REPO_DIR"/bash_functions.sh ]; then
    . "$BASH_REPO_DIR"/bash_functions.sh
fi

# PATH Variable
export PATH="$PATH:/home/ansible/.local/bin"
export PATH="$PATH:/home/xcad/.cargo/bin"

# Bash History Settings
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
