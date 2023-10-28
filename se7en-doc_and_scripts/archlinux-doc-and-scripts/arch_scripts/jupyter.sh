#!/usr/bin/bash

#********************************************
# Author      : lcdse7en                    *
# E-mail      : 2353442022@qq.com           *
# Create_Time : 2023-10-24 12:21            *
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

install() {
    pip install jupyterlab
    pip install jupyter_contrib_nbextensions
    pip install jupyter notebook==6.1.0
    # jupyter-contrib-nbextension install --user
    # pip install jupyterthemes
}

main() {
    install
}

main
