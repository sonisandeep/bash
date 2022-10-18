#!/bin/bash
#
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