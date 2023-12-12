#!/usr/bin/bash

#********************************************
# Author      : lcdse7en                    *
# E-mail      : 2353442022@qq.com           *
# Create_Time : 2023-12-11 21:18:31         *
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

source global.sh

Install_yay() {
    if pkg_installed yay; then
        exit 0
    fi

    if [ -d ~/Clone ]; then
        echo "~/Clone directory exists..."
        rm -rf ~/Clone/yay
    else
        mkdir ~/Clone
        echo "~/Clone directory created..."
    fi

    if pkg_installed git; then
        git clone https://aur.archlinux.org/yay.git ~/Clone/yay
        cd ~/Clone/yay
    else
        echo "git dependency is not installed..."
        exit 1
    fi

    makepkg -si
    if [ $? -eq 0 ]; then
        cd ~
        echo "aur helper installed, yayyy..."
        exit 0
    else
        cd ~
        echo "yay installation failed..."
        exit 1
    fi
}

main() {
    Install_yay
}

main
