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
        okular
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
        net-tools
        tree
        autojump
        redis
        btop
        chromium
        ttf-joypixels
        ttf-firacode-nerd
        ttf-jetbrains-mono-nerd
        ttf-linux-libertine
        ttf-ibm-plex
        adobe-source-han-sans-cn-fonts
        adobe-source-han-serif-cn-fonts
        xwallpaper
        nitrogen
        flameshot
        mysql-workbench
        gnome-keyring
        feh
        neofetch
        nodejs
        npm
        ffmpegthumbnailer
        mpv
        pamixer
        mpc
        mpd
        ncmpcpp
        sof-firmware
        pipewire
        wireplumber
        pipewire-pulse
        pipewire-alsa
        bluez
        bluez-utils
        blueman
        pavucontrol
        transmission-cli
        libreoffice
        perl-image-exiftool
        cava
        calcurse
        playerctl
        xdotool
        jq
        stylua
        typst
        python
        go
        deno
        docker
        docker-compose
        qemu
        libvirt
        bridge-utils
        flex
        bison
        edk2-ovmf
        mariadb
        kcalc
        geoip
        newsboat
        cups
        system-config-printer
        ghostscript
        gsfonts
        gutenprint
        # hpoj
        # hplip
        python-pyqt5
        python-reportlab
        python-notify2
        sane
        xsane
    )

    for element in "${array[@]}"; do
        installed=$(sudo pacman -Qs "^${element}")
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
