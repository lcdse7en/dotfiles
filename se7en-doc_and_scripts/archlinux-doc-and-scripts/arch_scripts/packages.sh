#!/usr/bin/bash

#********************************************
# Author      : lcdse7en
# E-mail      : 2353442022@qq.com
# Create_Time : 2023-10-04 19:52
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

Install_packages() {
    array=(
        man
        base-devel
        xorg
        xorg-xinit
        xorg-server
        git
        lazygit
        wget
        curl
        atool
        zsh
        bob
        openssh
        plocate
        cronie
        bat
        glow
        fzf
        zathura
        lf
        joshuto
        stow
        nsxiv
        trash-cli
        tmux
        github-cli
        poppler
        yay-git
        xsel
        xclip
        ripgrep
        unzip
        tree
        autojump
        redis
        btop
        chromium
        ttf-joypixels
        ttf-firacode-nerd
        ttf-jetbrains-mono-nerd
        ttf-linux-libertine
        noto-fonts-sc
        nitrogen
        flameshot
        feh
        neofetch
        nodejs
        npm
        mpv
        mpc
        mpd
        transmission-cli
        libreoffice
        perl-image-exiftool
        jq
        stylua
        typst
        python
        rust
        go
        docker
        docker-compose
    )

    for element in "${array[@]}"; do
        installed=$(sudo pacman -Qs "${element}")
        if [[ ! $installed ]]; then
            printf "\n$YELLOW%s$RESET\n" "Installing ${element} ..."
            printf "$SKYBLUE%s"
            printf "*%.0s" {1..60}
            printf "$RESET%s\n"
            sudo pacman -S --noconfirm "${element}"
        else
            printf "$RED${element}$RESET%s\n" ": has been installed on your machine"
        fi
    done
}

main() {
    Install_packages
}

main
