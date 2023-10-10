#!/usr/bin/bash

#********************************************
# Author      : lcdse7en                    *
# E-mail      : 2353442022@qq.com           *
# Create_Time : 2023-10-10 19:27            *
# Description :                             *
#********************************************

# source /etc/profile.d/import_shell_libs.sh

RED=$(printf '\033[31m')
GREEN=$(printf '\033[32m')
YELLOW=$(printf '\033[33m')
BLUE=$(printf '\033[34m')
SKYBLUE=$(printf '\033[36m')
BOLD=$(printf '\033[1m')
RESET=$(printf '\033[m')

downDir=$HOME/Downloads

download_texlive_iso() {
    printf "$BLUE%s${downDir} ...$RESET" "Downloading iso to "
    cd "$downDir" || exit
    wget https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/texlive.iso
}

install_texlive() {
    sudo rm -rf /usr/local/texlive

    cd "$downDir" || exit
    sudo mount -o loop texlive.iso /mnt
    cd /mnt || exit
    sudo ./install-tl
    sudo umount /mnt
}

main() {

    printf "${YELLOW}%s"
    read -r -p "Have you already downloaded texlive ISO? [y/N] " -e answer
    printf "${RESET}%s\n"

    if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
        download_texlive_iso
        install_texlive
    else
        install_texlive
    fi
}

main
