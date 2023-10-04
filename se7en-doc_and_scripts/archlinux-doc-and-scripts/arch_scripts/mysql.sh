#!/usr/bin/bash

#********************************************
# Author      : lcdse7en
# E-mail      : 2353442022@qq.com
# Create_Time : 2023-10-04 23:08
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

Install_mysql() {
    sudo pacman -S mysql
}

Server() {
    sudo systemctl enable mysqld.service
    sudo systemctl start mysqld.service
    sudo systemctl list-unit-files | grep mysqld.service
}
main() {
    Server
}

main
