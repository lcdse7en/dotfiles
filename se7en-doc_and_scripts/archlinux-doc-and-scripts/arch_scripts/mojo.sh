#!/usr/bin/bash

#********************************************
# Author      : lcdse7en
# E-mail      : 2353442022@qq.com
# Create_Time : 2023-10-05 09:13
# Description :
#********************************************

# source /etc/profile.d/import_shell_libs.sh

RED=$(printf '\033[31m')
GREEN=$(printf '\033[32m')
YELLOW=$(printf '\033[33m')
BLUE=$(printf '\033[34m')
SKYBLUE=$(printf '\033[36m')
BOLD=$(printf '\033[1m')
RESET=$(printf '\033[m')

Install_mojo() {
    curl https://get.modular.com |
        MODULAR_AUTH=mut_9003a4f2cce44096bd8d3165ff9c1678 \
            sh -
    sudo pacman -S modular
    modular --version
    modular install mojo
}

main() {
    Install_mojo
}

main