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


# Add this in your ~/.bashrc to load these set of scripts
# export REPOS_DIR="$HOME""/Repos"
# export BASH_REPO_DIR="$REPOS_DIR""/bash"
# if [ -f "$BASH_REPO_DIR"/bashrc.sh ]; then
#     . "$BASH_REPO_DIR"/bashrc.sh
# fi