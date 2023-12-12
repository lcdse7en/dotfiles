#!/usr/bin/bash

#********************************************
# Author      : lcdse7en                    *
# E-mail      : 2353442022@qq.com           *
# Create_Time : 2023-12-11 21:48:31         *
# Description :                             *
#********************************************

# source /etc/profile.d/import_shell_libs.sh

source global.sh

RED=$(printf '\033[31m')
GREEN=$(printf '\033[32m')
YELLOW=$(printf '\033[33m')
BLUE=$(printf '\033[34m')
SKYBLUE=$(printf '\033[36m')
BOLD=$(printf '\033[1m')
RESET=$(printf '\033[m')

Install_packages() {

    install_list="${1:-se7en_hypr_pkg.lst}"
    yay_chk=0

    while read pkg; do
        if [[ ${pkg} == "yay" ]]; then
            yay_chk=1

        elif pkg_installed ${pkg}; then
            echo "skipping ${pkg}..."

        elif pkg_available ${pkg}; then
            echo "queueing ${pkg} from arch repo..."
            pkg_arch=$(echo $pkg_arch ${pkg})

        elif aur_available ${pkg}; then
            echo "queueing ${pkg} from aur..."
            pkg_aur=$(echo $pkg_aur ${pkg})

        else
            echo "error: unknown package..."
        fi
    done <$install_list

    if [ $(echo $pkg_arch | wc -w) -gt 0 ]; then
        echo "installing $pkg_arch from arch repo..."
        sudo pacman -S $pkg_arch
    fi

    if [ $yay_chk -eq 1 ]; then
        ./install_yay.sh 2>&1
    fi

    if [ $(echo $pkg_aur | wc -w) -gt 0 ]; then
        echo "installing $pkg_aur from aur..."
        yay -S $pkg_aur
    fi
}

main() {
    Install_packages
}

main
