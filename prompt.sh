#!/bin/bash
#
# Bash prompt
YELLOW=$'\033[0;38;5;222m'
MAGENTA=$'\033[0;38;5;211m'
PURPLE=$'\033[0;38;5;147m'
GREEN=$'\033[0;38;5;150m'
CYAN=$'\033[0;38;5;117m'
WHITE=$'\033[0;37m'
USER_COLOR=$MAGENTA
WORKING_DIR_COLOR=$CYAN
STANDARD_COLOR=$WHITE
force_color_prompt=yes


ID=$(whoami)
if [ "$ID" = "root" ]; then
  SYMBOL="#"
 else
  SYMBOL="$"
fi

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[$WORKING_DIR_COLOR\]\w \[$SYMBOL\]\[$STANDARD_COLOR\] '
else
    PS1='\u@\h:\w\[$SYMBOL\] '
fi


unset color_prompt force_color_prompt


if [ ${MACHINE} = "Mac" ]; then
    NEWLINE=$'\n'
    PROMPT="%F{cyan}%T@%d%f:>${NEWLINE}~$ "
fi