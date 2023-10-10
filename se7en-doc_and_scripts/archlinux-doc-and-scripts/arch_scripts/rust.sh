#!/usr/bin/bash

#********************************************
# Author      : lcdse7en                    *
# E-mail      : 2353442022@qq.com           *
# Create_Time : 2023-10-06 15:53            *
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

Install_rust() {
    installed=$(sudo pacman -Qs stow)
    if [[ "$installed" ]]; then
        stow "$HOME"/dotfiles/cargo >/dev/null 2>&1
    else
        sudo pamcan -S stow
        stow "$HOME"/dotfiles/cargo >/dev/null 2>&1
    fi

    printf "$YELLOW%s$RESET\n" "Installing rust ..."
    printf "$SKYBLUE%s"
    printf "*%.0s" {1..60}
    printf "$RESET%s\n"

    curl https://sh.rustup.rs -sSf | sh

    printf "$YELLOW%s$RESET\n" "rust version:"
    printf "$SKYBLUE%s"
    printf "*%.0s" {1..60}
    printf "$RESET%s\n"
    printf "$\nGREEN%s"
    rustc --version
    printf "$RESET%s\n"
}

Update_rust() {
    printf "$YELLOW%s$RESET\n" "Updating rust ..."
    printf "$SKYBLUE%s"
    printf "*%.0s" {1..60}
    printf "$RESET%s\n"
    rustup update
}

Uninstall_rust() {
    printf "$YELLOW%s$RESET\n" "Uinstalling rust ..."
    printf "$SKYBLUE%s"
    printf "*%.0s" {1..60}
    printf "$RESET%s\n"
    rustup self uninstall
}

main() {
    # Install_rust
    Update_rust
    # Uninstall_rust
}

main
