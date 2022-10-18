#!/bin/bash
#
# Bash functions
# System info

get_OS () {
    hostnamectl | grep -Po "^Operating System: \K[^<]+"
}

# Updates
update () {
    if [[ $(get_OS) == *"Ubuntu"* ]]; then
        sudo echo -e "updating available software\n----"
        sudo apt-get update;
        echo -e "\nupgrading software\n----"
        sudo apt-get upgrade;
        echo -e "\nremoving obsolete dependency software\n----"
        sudo apt-get autoremove --purge;
        echo -e "\nremoving software in local cache\n----"
        sudo apt-get clean;
        echo "Done"
    elif [[ $(get_OS) == *"Fedora"* ]]; then
        sudo echo -e "updating available software\n----"
        sudo dnf upgrade
        echo -e "\nremoving obsolete dependency software\n----"
        sudo dnf autoremove
        echo -e "\nremoving software in local cache\n----"
        sudo dnf clean all
        echo "Done"
    fi
}
