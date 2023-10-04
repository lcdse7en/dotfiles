#!/usr/bin/bash

#********************************************
# Author      : lcdse7en
# E-mail      : 2353442022@qq.com
# Create_Time : 2023-10-04 21:32
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

AddUser() {
    useradd -m -G wheel se7en
    passwd se7en <<-EOF
	921216
	921216
	EOF
}

Wheel() {
    sed -i 's/^# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers
    sed -i 's/^# %wheel ALL=(ALL:ALL) NOPASSWD: ALL%/%wheel ALL=(ALL:ALL) NOPASSWD: ALL/' /etc/sudoers
}

main() {
    AddUser
    Wheel
}

main
