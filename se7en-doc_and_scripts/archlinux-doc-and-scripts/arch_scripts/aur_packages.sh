#!/usr/bin/bash

#********************************************
# Author      : lcdse7en
# E-mail      : 2353442022@qq.com
# Create_Time : 2023-10-04 21:14
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

Install_packages() {
    array=(
        picom-git
        # mojo
        fixjson
        ttf-times-new-roman
        tex-gyre-math-fonts
        rar
        google-chrome
        wps-office
        ttf-wps-fonts
        ttf-cascadia-code
        # navicat
        lemonbar-xft-git
        qqmusic-bin
        obs-studio
    )
    for element in "${array[@]}"; do
        installed=$(yay -Qs "$element")
        if [[ "$installed" ]]; then
            printf "$RED$element$RESET%s\n" " : has been installed on your machine."
        else
            printf "\n$GREEN%s$element ... $RESET\n" "Installing "
            printf "$SKYBLUE%s"
            printf "*%.0s" {1..60}
            printf "$RESET%s\n"
            yay -S --noconfirm "$element"
        fi
    done
}

main() {
    Install_packages
}

main
