#!/usr/bin/bash

#********************************************
# Author      : lcdse7en
# E-mail      : 2353442022@qq.com
# Create_Time : 2023-10-04 18:24
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

Git_config() {
    printf "$YELLOW%s"
    printf "%s" "git config --global ... to set ..."
    printf "$RESET%s\n"
    printf "$SKYBLUE%s"
    printf "*%.0s" {1..50}
    printf "$RESET%s\n"

    git config --global user.name "lcdse7en"
    git config --global user.email "2353442022@qq.com"

    printf "$GREEN%s"
    printf "%s\n" "git config --global user.name lcdse7en"
    printf "%s\n" "git config --global user.email 2353442022@qq.com"
    printf "$RESET%s"

    printf "$SKYBLUE%s"
    printf "*%.0s" {1..50}
    printf "$RESET%s\n"

    printf "$RED%s"
    echo "git has been seted."
    printf "$RESET%s"
}

main() {
    Git_config
}

main
