#!/usr/bin/bash

#********************************************
# Author      : lcdse7en
# E-mail      : 2353442022@qq.com
# Create_Time : 2023-10-04 21:57
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
        udevil
        zenity
    )
    for element in "${array[@]}"; do
        installed=$(yay -Qs "$element")
        if [[ $installed ]]; then
            printf "$RED$element$RESET%s\n" ": has been installed on your machine."
        else
            yay -S "$element"
        fi
    done
}

Service() {
    printf "\n$YELLOW%s$RESET\n" "Start devmon server ..."
    printf "$SKYBLUE%s"
    printf "*%.0s" {1..50}
    printf "$RESET%s\n"
    sudo systemctl start devmon@se7en
    sudo systemctl enable devmon@se7en
    printf "$GREEN%s$RESET\n" "sudo systemctl start devmon@se7en"
    printf "$GREEN%s$RESET\n" "sudo systemctl enable devmon@se7en"
    printf "*%.0s" {1..50}
    printf "$RESET%s\n"
    printf "$RED%s$RESET\n" "The service is already on."
}

main() {
    Install_packages
    Service
}

main
