#!/bin/bash
#
 
# Source and reload bashrc
alias edp="vi ~/.bashrc"
alias rdp="source ~/.bashrc"

# Bash aliases
alias get_my_ip="echo $(curl -s ifconfig.me)"

# General aliases which are helpful
alias mount="mount |column -t"
alias ..='cd ..'
alias ...='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

alias ports='netstat -tulanp'

## shortcut  for iptables and pass it via sudo#
alias ipt='sudo /sbin/iptables'
 
# display all rules #
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist

## pass options to free ##
alias meminfo='free -m -l -t'
 
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
 
## Get server cpu info ##
alias cpuinfo='lscpu'
 
## older system use /proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##
 
## get GPU ram on desktop / laptop##
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

alias ls="exa --icons --color=always $*"

alias vdhcp="virsh net-dhcp-leases default"


# tmux related aliases

# Attaches tmux to the last session; creates a new session with a panel split into left and right
alias t='tmux attach || tmux new-session -s default\; new-window\; new-window'

alias ta='tmux attach -t'

# Creates a new session
alias tn='tmux new-session'

# Lists all ongoing sessions
alias tl='tmux list-sessions'


#Proxmox Section
alias qmt="qm terminal $1 --escape ^]"
