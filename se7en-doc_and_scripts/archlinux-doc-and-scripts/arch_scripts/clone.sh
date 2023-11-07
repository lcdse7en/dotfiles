#!/usr/bin/bash

#********************************************
# Author      : lcdse7en                    *
# E-mail      : 2353442022@qq.com           *
# Create_Time : 2023-11-04 15:00            *
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

clone_repo() {
    local target_dir="$HOME/github_upload"

    if [[ -d "$target_dir" ]]; then
        cd "$target_dir" || exit
        printf "${SKYBLUE}%s"
        printf "*%.0s" {1..60}
        printf "${RESET}%s\n"
        printf "$YELLOW target dir: $target_dir %s$RESET\n"
        printf "${SKYBLUE}%s"
        printf "*%.0s" {1..60}
        printf "${RESET}%s\n"

        # git clone git@github.com:lcdse7en/chrome_extensions.git
        # git clone git@github.com:lcdse7en/texdata1.git
        # git clone git@github.com:lcdse7en/texdata2.git
        # git clone git@github.com:lcdse7en/Music.git

        # git clone git@github.com:lcdse7en/lyrics.git
        # git clone git@github.com:lcdse7en/korean.git
        # git clone git@github.com:lcdse7en/pandas.git
        # git clone git@github.com:lcdse7en/os.git
        # git clone git@github.com:lcdse7en/contact.git
        # git clone git@github.com:lcdse7en/country_list.git

        #  NOTE: work

        # git clone git@github.com:lcdse7en/accounting.git
    else
        printf "${SKYBLUE}%s"
        printf "*%.0s" {1..60}
        printf "${RESET}%s\n"
        printf "$YELLOW Creating dir: ${target_dir} ...%s$RESET\n"
        printf "${SKYBLUE}%s"
        printf "*%.0s" {1..60}
        printf "${RESET}%s\n"

        mkdir "$target_dir"

        cd "$target_dir" || exit
        git clone git@github.com:lcdse7en/chrome_extensions.git
        git clone git@github.com:lcdse7en/texdata1.git
        git clone git@github.com:lcdse7en/texdata2.git
        git clone git@github.com:lcdse7en/Music.git

        git clone git@github.com:lcdse7en/lyrics.git
        git clone git@github.com:lcdse7en/korean.git
        git clone git@github.com:lcdse7en/pandas.git
        git clone git@github.com:lcdse7en/os.git
        git clone git@github.com:lcdse7en/contact.git
        git clone git@github.com:lcdse7en/country_list.git

        #  NOTE: work
        git clone git@github.com:lcdse7en/accounting.git
    fi
}

main() {
    clone_repo
}

main
