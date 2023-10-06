#!/usr/bin/bash

#********************************************
# Author      : lcdse7en                    *
# E-mail      : 2353442022@qq.com           *
# Create_Time : 2023-10-06 13:16            *
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

Install_rye() {
    printf "$YELLOW%s$RESET\n" "Installing rye ..."
    printf "$SKYBLUE%s"
    printf "*%.0s" {1..60}
    printf "$RESET%s\n"
    cargo install --git https://github.com/mitsuhiko/rye rye
}

main() {
    Install_rye
}

main
