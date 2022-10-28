#!/bin/bash
#
# Bash functions
# System info

get_OS () {
    hostnamectl | grep -Po "^Operating System: \K[^<]+"
}


simple-http-server() {
    docker stop http-server
    docker run --rm \
            --name http-server \
            -v $(pwd):/serve \
            -P \
            -d \
            jdkelley/simple-http-server:latest
    echo -ne "\nBrowse to http://localhost:"
    docker port http-server | cut -d':' -f'2'
    docker logs -f http-server
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

# Aliases and functions which help in working with virsh and qemu
function sshl {
  ip=$(virsh net-dhcp-leases default | grep ${1} | awk '{print $5}' | sed 's/\/24//')
  ssh ubuntu@${ip} -i ~/.ssh/id_cloudinit_rsa
}

function myip {
  ip=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')
  echo $ip
}

export -f sshl


##################################################### PROXMOX ######################################################
function pve_vmip {
    qm guest cmd $1 network-get-interfaces
}