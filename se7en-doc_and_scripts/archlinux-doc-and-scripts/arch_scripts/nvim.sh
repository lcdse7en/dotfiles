#!/usr/bin/bash

#********************************************
# Author      : lcdse7en
# E-mail      : 2353442022@qq.com
# Create_Time : 2023-10-04 14:31
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

Remove_neovim() {
    printf "$YELLOW %s $RESET \n" "removing old neovim version on your machine ..."
    sudo rm -rf /usr/bin/nvim >/dev/null
    sudo rm -rf /usr/share/nvim >/dev/null
    sudo rm -rf /usr/lib/nvim >/dev/null
    printf "$RED %s $RESET \n" "Old nvim is removed on your machine!"
    printf "\n"
}

Install_bob() {
    installed="$(sudo pacman -Qs bob)"
    if [[ "$installed" ]]; then
        printf "$RED bob$RESET%s\n" ": has been installed on your machine."
    else
        printf "$YELLOW%s$RESET\n" "Installing bob ..."
        printf "$SKYBLUE%s"
        printf "*%.0s" {1..60}
        printf "$SKYBLUE%s\n"
        sudo pacman -S bob
    fi
}

Install_neovim() {
    printf "$YELLOW%s$RESET\n" "Select the number for the neovim version you want to install..."
    printf "$GREEN*%.0s$RESET" {1..50}
    printf "\n"
    printf "\t$SKYBLUE%s\n" "1: Install neovim of Nightly version"
    printf "\t%s\n" "2: Install neovim of Stable version"
    printf "\t%s$RESET\n" "3: Install neovim of Nightly and Stable version"
    printf "$GREEN*%.0s$RESET" {1..50}
    printf "\n"
    printf "$YELLOW%s" ""
    read -p "Please Enter Num (1 | 2 | 3): " -e version
    case ${version} in
    1)
        bob install nightly
        bob list
        ;;
    2)
        bob install stable
        bob list
        ;;
    3)
        bob install nightly
        bob install stable
        bob list
        ;;
    *)
        printf "$RED %s $RESET \n" "The input Num is incorrect, Please re-enter it!"
        printf "\n"
        ;;
    esac
}

Use_neovim() {
    printf "$YELLOW%s$RESET\n" "Determine which neovim version to use..."
    printf "$GREEN*%.0s$RESET" {1..30}
    printf "\n"
    printf "\t$SKYBLUE%s\n" "1: Use neovim of Nightly version"
    printf "\t%s$RESET\n" "2: Use neovim of Stable version"
    printf "$GREEN*%.0s$RESET" {1..30}
    printf "\n"
    printf "$YELLOW%s" ""
    read -r -p "Please Enter Num (1 | 2): " -e version
    case ${version} in
    1)
        bob use nightly
        bob list
        printf "$YELLOW%s$RESET" "neovim nightly version has been used, now."
        printf "\n"
        ;;
    2)
        bob use stable
        bob list
        printf "$YELLOW%s$RESET" "neovim stable version has been used, now."
        printf "\n"
        ;;
    *)
        printf "$RED %s $RESET \n" "The input Num is incorrect, Please re-enter it!"
        printf "\n"
        ;;
    esac
}

Update_neovim() {
    printf "$YELLOW%s" ""
    read -r -p "Update neovim version, Now? [y/N] " answer
    if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
        printf "\t$RED%s$RESET\n" "The neovim version has not been updated!"
    else
        printf "\n"
        printf "$GREEN*%.0s$RESET" {1..30}
        printf "\n"
        printf "$YELLOW%s$RESET" "Updating neovim version ..."
        printf "\n"
        bob update --all
        bob list
        printf "$YELLOW%s$RESET" "Update neovim Done!"
        printf "\n"
        printf "$GREEN*%.0s$RESET" {1..30}
        printf "\n"
    fi
}

Clone_vimrc() {
    local vimrcDir="$HOME/.config/nvim"
    if [[ ! -d "$vimrcDir" ]]; then
        git clone https://github.com/lcdse7en/nvim_lazy.git "$vimrcDir"
    else
        printf "${RED}Directory:$RESET$GREEN${vimrcDir}$RED is exist.%s$RESET\n"
    fi
}

main() {
    Remove_neovim
    Install_bob
    Install_neovim
    Use_neovim
    Update_neovim
    Clone_vimrc
}

main
