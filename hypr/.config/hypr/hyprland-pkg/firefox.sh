#!/usr/bin/bash

#********************************************
# Author      : lcdse7en                    *
# E-mail      : 2353442022@qq.com           *
# Create_Time : 2023-12-11 22:28:30         *
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

source global.sh
Firefox() {

    # firefox
    if pkg_installed firefox; then
        echo "launching firefox..."
        /usr/bin/firefox &
        ffox_pid=$!
        sleep 5
        kill -9 $ffox_pid

        if [ -d ~/.mozilla/firefox/*.default-release ]; then
            FoxRel=$(ls -l ~/.mozilla/firefox/ | grep .default-release | awk '{print $NF}')

            if [ ! -d ~/.mozilla/firefox/${FoxRel}/chrome ]; then
                mkdir ~/.mozilla/firefox/${FoxRel}/chrome
            fi
            cp ~/dotfiles/source/t2_firefox.css ~/.mozilla/firefox/${FoxRel}/chrome/userChrome.css
            echo 'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);' >~/.mozilla/firefox/${FoxRel}/user.js
            echo 'user_pref("browser.tabs.tabmanager.enabled", false);' >>~/.mozilla/firefox/${FoxRel}/user.js
        fi
    fi
}
main() {
    Firefox
}

main
