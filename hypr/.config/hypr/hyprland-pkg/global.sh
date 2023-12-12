#!/usr/bin/bash

#********************************************
# Author      : lcdse7en                    *
# E-mail      : 2353442022@qq.com           *
# Create_Time : 2023-12-11 21:16:39         *
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

pkg_installed() {
    local PkgIn=$1

    if pacman -Qi $PkgIn >/dev/null; then
        echo "${PkgIn} is already installed..."
        return 0
    else
        echo "${PkgIn} is not installed..."
        return 1
    fi
}

pkg_available() {
    local PkgIn=$1

    if pacman -Si $PkgIn >/dev/null; then
        echo "${PkgIn} available in arch repo..."
        return 0
    else
        echo "${PkgIn} not available in arch repo..."
        return 1
    fi
}

aur_available() {
    local PkgIn=$1

    if pkg_installed yay; then
        if yay -Si $PkgIn >/dev/null; then
            echo "${PkgIn} available in aur repo..."
            return 0
        else
            echo "${PkgIn} not available in aur repo..."
            return 1
        fi
    else
        echo "yay is not installed..."
        return 1
    fi
}
