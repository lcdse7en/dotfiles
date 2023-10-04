#!/usr/bin/bash

#********************************************
# Author      : lcdse7en
# E-mail      : 2353442022@qq.com
# Create_Time : 2023-10-04 20:43
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

downloadDir="$HOME/Downloads"

Suckless() {
    if [[ ! -d "${downloadDir}" ]]; then
        mkdir "$HOME"/Downloads
    else
        git clone https://github.com/lcdse7en/dwm.git "$downloadDir"/dwm
        git clone https://github.com/lcdse7en/st.git "$downloadDir"/st
        git clone https://github.com/lcdse7en/dwmblocks.git "$downloadDir"/dwmblocks
        git clone https://github.com/lcdse7en/slock.git "$downloadDir"/slock
    fi
}

Install_dwm() {
    local dwmDir=${downloadDir}/dwm
    cd "$dwmDir" || exit
    sudo make
    sudo make clean install
}

Install_st() {
    local stDir=${downloadDir}/st
    cd "$stDir" || exit
    sudo make
    sudo make clean install
}

Install_dwmblocks() {
    local dwmblocksDir=${downloadDir}/dwmblocks
    cd "$dwmblocksDir" || exit
    sudo make
    sudo make clean install
}

Install_slock() {
    local slockDir=${downloadDir}/slock
    cd "$slockDir" || exit
    sudo make
    sudo make clean install
}
main() {
    Suckless
    Install_dwm
    Install_st
    Install_dwmblocks
    Install_slock
}

main
