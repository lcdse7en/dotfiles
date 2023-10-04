#!/usr/bin/bash

#********************************************
# Author      : lcdse7en
# E-mail      : 2353442022@qq.com
# Create_Time : 2023-10-04 22:14
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

Install_redis() {
    array=(
        redis
    )
    for element in "${array[@]}"; do
        installed=$(sudo pacman -Qs "$element")
        if [[ "$installed" ]]; then
            printf "$RED$element$RESET%s\n" ": has been is installed."
        else
            printf "$GREEN%s$element ...$RESET%s\n" "Installing "
            printf "$SKYBLUE%s"
            printf "*%.0s" {1..60}
            printf "$RESET%s\n"
            sudo pacman -S --noconfirm "$element"
        fi
    done
}

Service() {
    printf "\n$YELLOW%s$RESET\n" "Start redis server ..."
    printf "$SKYBLUE%s"
    printf "*%.0s" {1..50}
    printf "$RESET%s\n"
    printf "$GREEN%s$RESET\n" "sudo systemctl enable redis"
    printf "$GREEN%s$RESET\n" "sudo systemctl start redis"
    sudo systemctl enable redis
    sudo systemctl start redis
    printf "$SKYBLUE%s"
    printf "*%.0s" {1..50}
    printf "$RESET%s\n"
    printf "$RED%s$RESET\n" "The redis service is already on."
    # sudo systemctl status redis
    sudo redis-cli
}

main() {
    Install_redis
    Service
}

main
