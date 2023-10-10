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
    installed=$(which rye >/dev/null 2>&1)
    if [[ ! "$installed" ]]; then
        printf "$YELLOW%s$RESET\n" "Installing rye ..."
        printf "$SKYBLUE%s"
        printf "*%.0s" {1..60}
        printf "$RESET%s\n"

        # cargo install --git https://github.com/mitsuhiko/rye rye
        cargo install --git https://github.com/lcdse7en/rye rye

        printf "$YELLOW%s$RESET\n" "rye version"
        printf "$SKYBLUE%s"
        printf "*%.0s" {1..60}
        printf "$RESET%s\n"
        rye --version
    else
        printf "$RED%s$RESET\n" "rye has been installed on your machine."

    fi
}

#  NOTE: rye init my_project
#  NOTE: cd my_project

Rye_pin() {
    printf "$YELLOW%s$RESET\n" "rye pin ..."
    printf "$SKYBLUE%s"
    printf "*%.0s" {1..60}
    printf "$RESET%s\n"

    # rye init project-name
    rye pin cpython@3.10
    # rye sync
}

#  NOTE: pyproject.toml
Rye_add() {
    printf "$YELLOW%s$RESET\n" "rye add ... and rye sync"
    printf "$SKYBLUE%s"
    printf "*%.0s" {1..60}
    printf "$RESET%s\n"

    array=(
        scrapy
        bs4
        pandas
        numpy
        openpyxl
        requirs
    )
    rye add "${array[@]}"
    rye sync
}

#  NOTE: install global python tools
Install_packages() {
    local array=(
        black
        pygment
    )
    rye install "${array[@]}"
}

#  NOTE: Uninstall global python tools
Uninstall_packages() {
    local array=(
        black
        pygment
    )
    rye uninstall "${array[@]}"
}

Rye_update() {
    printf "$YELLOW%s$RESET\n" "Updating rye ..."
    printf "$SKYBLUE%s"
    printf "*%.0s" {1..60}
    printf "$RESET%s\n"
    rye self update
}

Uninstall_rye() {
    printf "$YELLOW%s$RESET\n" "Uinstalling rye ..."
    printf "$SKYBLUE%s"
    printf "*%.0s" {1..60}
    printf "$RESET%s\n"
    rye self uninstall
}

Rye_env() {
    echo "export RYE_NO_AUTO_INSTALL=1" >>"$HOME"/.zshrc
    # echo "export PATH=\$PATH:\$HOME/.rye/shims" >>"$HOME"/.zshrc
    echo "source \$HOME/.rye/env" >>"$HOME"/.zshrc
}

Python_list_installed() {
    printf "$YELLOW%s$RESET\n" "python list (installed) : "
    printf "$SKYBLUE%s"
    printf "*%.0s" {1..75}
    printf "$RESET%s\n"
    rye toolchain list
}

Python_list_downloadable() {
    printf "$YELLOW%s$RESET\n" "python list (downloadable) : "
    printf "$SKYBLUE%s"
    printf "*%.0s" {1..60}
    printf "$RESET%s\n"
    rye toolchain list --include-downloadable
}

#  NOTE: 拉取某个python版本
fetch() {
    printf "$YELLOW%s$RESET\n" "rye toolchain fetch ... "
    printf "$SKYBLUE%s"
    printf "*%.0s" {1..60}
    printf "$RESET%s\n"
    read -r -p "Enter python version want to fetch(3.10.11): " -e ver
    rye toolchain fetch "$ver"
}

#  NOTE: 删除某个python版本
remove() {
    printf "$YELLOW%s$RESET\n" "rye toolchain remove ... "
    printf "$SKYBLUE%s"
    printf "*%.0s" {1..60}
    printf "$RESET%s\n"
    read -r -p "Enter python version want to remove(3.10.11): " -e ver
    rye toolchain remove "$ver"
}

main() {
    # Install_rye
    # Rye_pin
    # Rye_add
    # Install_packages
    # Uninstall_packages
    # Rye_env
    Python_list_installed
    # Python_list_downloadable
    # fetch
    # remove
}

main
