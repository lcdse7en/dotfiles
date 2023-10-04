#!/usr/bin/bash

#********************************************
# Author      : lcdse7en
# E-mail      : 2353442022@qq.com
# Create_Time : 2023-10-04 18:34
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

Install_openssh() {
    exis=$(sudo pacman -Qs openssh)
    if [[ $exis ]]; then
        printf "$RED%s"
        printf "%s" "openssh has been installed on your machine.Now update it..."
        printf "$RESET%s\n"
    else
        sudo pacman -S openssh
    fi
}

Ssh-keygen() {
    printf "\n$YELLOW%s"
    printf "%s" "ssh-keygen -t rsa"
    printf "$RESET%s\n"
    printf "$SKYBLUE*%.0s" {1..60}
    printf "$RESET%s\n"
    ssh-keygen -t rsa

    printf "\n$YELLOW%s"
    printf "%s" "cat ~/.ssh/id_rsa.pub"
    printf "$RESET%s\n"
    printf "$SKYBLUE*%.0s" {1..60}
    printf "$RESET%s\n"
    cat "$HOME"/.ssh/id_rsa.pub

    local pubkey="$HOME/dotfiles/se7en-doc_and_scripts/archlinux-doc-and-scripts/arch_scripts/id_rsa.pub.txt"
    cat "$HOME"/.ssh/id_rsa.pub >"$pubkey"
    printf "\n$GREEN%s"
    printf "%s\n" "File: $pubkey has been generated."
    printf "$SKYBLUE*%.0s" {1..60}
    printf "$RESET%s\n"
}

Service() {
    sudo systemctl enable sshd.service
    sudo systemctl start sshd.service
    printf "\n$GREEN%s"
    printf "%s" "ssh service is started for you."
    printf "$RESET%s\n"
}

main() {
    Install_openssh
    Ssh-keygen
    Service
}

main
