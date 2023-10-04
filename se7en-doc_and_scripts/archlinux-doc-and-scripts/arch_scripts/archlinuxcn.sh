#!/usr/bin/bash

#********************************************
# Author      : lcdse7en
# E-mail      : 2353442022@qq.com
# Create_Time : 2023-10-04 20:31
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

Archlinuxcn() {
    printf "$YELLOW%s$RESET\n" "Add ArchLinuxcn Mirror ..."
    printf "$SKYBLUE%s"
    printf "*%.0s" {1..65}
    printf "$GREEN%s\n"
    sudo tee -a /etc/pacman.conf <<-EOF
	[archlinuxcn]
	SigLevel = Optional TrustAll
	Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/\$arch
	EOF
    printf "$SKYBLUE%s"
    printf "*%.0s" {1..65}
    printf "$RESET%s\n"
}

main() {
    Archlinuxcn
}

main
