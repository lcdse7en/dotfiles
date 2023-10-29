#!/usr/bin/bash

#********************************************
# Author      : lcdse7en
# E-mail      : 2353442022@qq.com
# Create_Time : 2023-10-05 09:13
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

Install_modular() {
    makepkg -si
    modular --version
}

Install_mojo() {
    modular clean
    modular auth mut_16132486efc04824ad90e4d5a2afbaed

    # modular auth mut_1ab442b0938f435388ecc1851d9b6286
    modular install mojo
    mojo --version
    # modular update mojo
}

main() {
    printf "${YELLOW}%s"
    read -r -p "Have you already downloaded Modular? [y/N] " -e answer
    printf "${RESET}%s\n"

    if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
        printf "${SKYBLUE}%s${RESET}" "Installing modular ..."
        Install_modular
    else
        mdlVer=$(modular --version)

        printf "${SKYBLUE}%s"
        printf "*%.0s" {1..60}
        printf "${RESET}%s\n"
        printf "${BLUE}%s ${mdlVer} ${RESET}\n" "modular version:"
        printf "${SKYBLUE}%s"
        printf "*%.0s" {1..60}
        printf "${RESET}%s\n"

        echo ""
        printf "${SKYBLUE}%s${RESET}\n" "Installing mojo ..."
        Install_mojo
    fi
}

main
