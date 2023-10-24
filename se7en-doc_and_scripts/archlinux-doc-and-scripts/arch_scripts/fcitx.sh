#!/usr/bin/bash

#********************************************
# Author      : lcdse7en
# E-mail      : 2353442022@qq.com
# Create_Time : 2023-10-02 19:33
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

Install_package() {
    array=(
        fcitx5-im
        fcitx5-chinese-addons
        fcitx5-material-color
        fcitx5-nord
        fcitx5-lua
        fcitx5-pinyin-zhwiki
        fcitx5-pinyin-moegirl
        fcitx5-hangul
        kcm-fcitx5
        fcitx5-anthy
        fcitx5-mozc
    )
    sudo pacman -S --noconfirm "${array[@]}"
}

Env() {
    sudo tee /etc/environment <<-EOF
		GTK_IM_MODULE=fcitx
		QT_IM_MODULE=fcitx
		XMODIFIERS=@im=fcitx
		INPUT_METHOD=fcitx
		SDL_IM_MODULE=fcitx
		GLFW_IM_MODULE=ibus
	EOF
    sudo tee ~/.pam_enviroment <<-EOF
		GTK_IM_MODULE DEFAULT=fcitx5
		QT_IM_MODULE  DEFAULT=fcitx5
		XMODIFIERS    DEFAULT=@im=fcitx5
	EOF
}

main() {
    Install_package
    # Env
}

main
