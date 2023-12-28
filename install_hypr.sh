#!/usr/bin/env sh

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

clonepath="$HOME/github_upload"
stowpath="$HOME/dotfiles"

Yay_packages() {
    array=(
        waybar-hyprland-git
        wlogout
        swaylock-effects-git
        hyprpicker-git
        grimblast-git
        nwg-look
        kvantum
        hyprshot
        wttrbar
        qbittorrent-qt5
        qt5ct
        ocs-url
        catppuccin-gtk-theme-mocha
        catppuccin-cursors-mocha
        catppuccin-mocha-grub-theme-git
        eww-wayland
        pokemon-colorscripts-git
        fontpreview
        ctpv
        ttf-times-new-roman
        google-chrome
        rar
        qqmusic-bin
        obs-studio
        transmission-remote-gui
    )
    for element in "${array[@]}"; do
        yay -S --noconfirm "$element"
    done
}

Paru_packages() {
    local array=(
        rofi-lbonn-wayland-git
        # code
        # code-features
        # code-marketplace
        colloid-gtk-theme-git
        papirus-icon-theme

    )
    for element in "${array[@]}"; do
        paru -S --noconfirm $element
    done
}

Pacman_packages() {
    array=(
        yay-git
        paru
        git
        hyprland-git
        kitty
        dunst
        swww
        swappy
        cliphist
        slurp
        dolphin
        konsole
        rust
        qt5-wayland
        qt6-wayland
        qt5-quickcontrols
        qt5-quickcontrols2
        qt5-graphicaleffects
        eza
        starship
        pacman-contrib
        polkit-kde-agent
        xdg-desktop-portal-hyprland
        parallel
        rsync
        pamixer
        pipewire
        pipewire-alsa
        pipewire-audio
        pipewire-jack
        # pipewire-pulse
        pulseaudio
        wireplumber
        blueman
        brightnessctl
        imagemagick
        qt5-imageformats
        ffmpegthumbs
        ark
        sddm-git
        kde-cli-tools
        lazygit
        reflector
        python-pip
        shfmt
        stylua
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
        zathura-pdf-poppler
        okular
        lf
        ueberzugpp
        lynx
        odt2txt
        gnumeric
        joshuto
        yazi
        stow
        nsxiv
        trash-cli
        tmux
        github-cli
        poppler
        xsel
        xclip
        ripgrep
        unzip
        net-tools
        tree
        autojump
        redis
        btop
        ttf-joypixels
        ttf-firacode-nerd
        ttf-jetbrains-mono-nerd
        ttf-linux-libertine
        ttf-ibm-plex
        adobe-source-han-sans-cn-fonts
        adobe-source-han-serif-cn-fonts
        nitrogen
        mysql-workbench
        gnome-keyring
        feh
        neofetch
        fastfetch
        fortune-mod
        cowsay
        lolcat
        nodejs
        npm
        ffmpegthumbnailer
        mpv
        mpc
        mpd
        ncmpcpp
        sof-firmware
        gst-plugin-pipewire
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
        jdk17-openjdk
        openjdk17-doc
        openjdk17-src
        jre17-openjdk
        jre17-openjdk-headless
        java-runtime-common
        freeplane
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
        yamlfmt
        vivid
        gnome-tweaks
        papirus-icon-theme
        kdenlive
        breeze
        gimp
        scribus
        helix
        numlockx
        qalculate-gtk
        wezterm
        udiskie
        net-tools
        dnsutils
        inetutils
        iproute2
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

GithubHosts() {
    sudo tee /etc/hosts<<-EOF
				#Github Hosts Start
				#Update Time: 2023-12-25
				#Project Address: https://githubfast.com/maxiaof/github-hosts
				#Update URL: https://usercontent.githubfast.com/raw/maxiaof/github-hosts/master/hosts
				140.82.113.4                 central.github.com
				140.82.113.4                 assets-cdn.github.com
				151.101.1.6                  github.map.fastly.net
				151.101.1.6                  github.global.ssl.fastly.net
				140.82.113.4                 gist.github.com
				185.199.108.153              github.io
				140.82.113.4                 github.com
				140.82.113.4                 api.github.com
				140.82.113.4                 codeload.github.com
				72.21.206.80                 github-cloud.s3.amazonaws.com
				72.21.206.80                 github-com.s3.amazonaws.com
				72.21.206.80                 github-production-release-asset-2e65be.s3.amazonaws.com
				72.21.206.80                 github-production-user-asset-6210df.s3.amazonaws.com
				72.21.206.80                 github-production-repository-file-5c1aeb.s3.amazonaws.com
				185.199.108.153              githubstatus.com
				140.82.114.18                github.community
				140.82.113.4                 raw.github.com
				#Github Hosts End
				EOF
}

CargoMirror() {
    # registry = "https://mirrors.tuna.tsinghua.edu.cn/git/crates.io-index.git"
    # registry = "https://mirrors.ustc.edu.cn/crates.io-index"
    sudo tee $HOME/.cargo/config<<-EOF
				[source.crates-io]
				replace-with = 'mirror'

				[source.mirror]
				registry = "https://mirrors.ustc.edu.cn/crates.io-index"
				EOF
}

Typst() {
    printf "${YELLOW}%s"
    read -r -p "Do you want to install typst? [y/N]" -e answer
    printf "${RESET}%s"

    if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
        printf "Skipping install typst."
    else
        cargo install --git https://github.com/typst/typst typst-cli
    fi

    printf "${YELLOW}%s"
    read -r -p "Do you want to install typst-lsp? [y/N]" -e answer
    printf "${RESET}%s"

    if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
        printf "Skipping install typst-lsp."
    else
        cd "$HOME/Downloads"
        git clone git@github.com:lcdse7en/typst-lsp.git
        cd "typst-lsp"
        cargo build --release
    fi

    printf "${YELLOW}%s"
    read -r -p "Do you want to install typstfmt? [y/N]" -e answer
    printf "${RESET}%s"

    if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
        printf "Skipping install typstfmt."
    else
        cargo install --git https://github.com/astrale-sharp/typstfmt.git

        # typstfmt --make-default-config
    fi

    printf "${YELLOW}%s"
    read -r -p "Do you want to install prettypst? [y/N]" -e answer
    printf "${RESET}%s"

    if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
        printf "Skipping install prettypst."
    else
        cargo install --git=https://githubfast.com/antonWetzel/prettypst.git --locked
    fi

    printf "${YELLOW}%s"
    read -r -p "Do you want to install typst-live? [y/N]" -e answer
    printf "${RESET}%s"

    if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
        printf "Skipping install typst-live."
    else
        cargo install typst-live
    fi

    printf "${YELLOW}%s"
    read -r -p "Do you want to install just for CetZ? [y/N]" -e answer
    printf "${RESET}%s"

    if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
        printf "Skipping install just."
    else
        cargo install just
    fi
}

Git_config() {
    printf "$YELLOW%s"
    printf "%s" "git config --global ... to set ..."
    printf "$RESET%s\n"
    printf "$SKYBLUE%s"
    printf "*%.0s" {1..50}
    printf "$RESET%s\n"

    git config --global user.name "lcdse7en"
    git config --global user.email "2353442022@qq.com"

    #  NOTE: set proxy for git
    # git config --global http.proxy http://127.0.0.1:1080
    # git config --global https.proxy https://127.0.0.1:1080

    #  NOTE: proxy preview
    # git config --global --get http.proxy
    # git config --global --get https.proxy

    #  NOTE: unset proxy
    # git config --global --unset http.proxy
    # git config --global --unset https.proxy

    printf "$GREEN%s"
    printf "%s\n" "git config --global user.name lcdse7en"
    printf "%s\n" "git config --global user.email 2353442022@qq.com"
    printf "$RESET%s"

    printf "$SKYBLUE%s"
    printf "*%.0s" {1..50}
    printf "$RESET%s\n"

    printf "$RED%s"
    echo "git has been seted."
    printf "$RESET%s"
}

Ssh-keygen() {
    printf "${YELLOW}%s"
    read -r -p "Are you sure to creat ssh-keygen, now? [y/N]" -e sshkeygen
    printf "${RESET}%s"

    if [[ "$sshkeygen" != y ]] && [[ "$sshkeygen" != Y ]]; then
        cat "$HOME"/.ssh/id_rsa.pub

        local pubkey="$HOME/id_rsa.pub.txt"
        cat "$HOME"/.ssh/id_rsa.pub >"$pubkey"
        printf "\n$GREEN%s"
        printf "%s\n" "File: $pubkey has been generated."
        printf "$SKYBLUE*%.0s" {1..60}
        printf "$RESET%s\n"
    else
        printf "\n$YELLOW%s"
        printf "%s" "ssh-keygen -t rsa"
        printf "$RESET%s\n"
        printf "$SKYBLUE*%.0s" {1..60}
        printf "$RESET%s\n"

        ssh-keygen -t rsa

        cat "$HOME"/.ssh/id_rsa.pub

        local pubkey="$HOME/id_rsa.pub.txt"
        cat "$HOME"/.ssh/id_rsa.pub >"$pubkey"
        printf "\n$GREEN%s"
        printf "%s\n" "File: $pubkey has been generated."
        printf "$SKYBLUE*%.0s" {1..60}
        printf "$RESET%s\n"

        printf "\n$YELLOW%s"
        printf "%s" "cat ~/.ssh/id_rsa.pub"
        printf "$RESET%s\n"
        printf "$SKYBLUE*%.0s" {1..60}
        printf "$RESET%s\n"
    fi

    printf "${YELLOW}%s"
    read -r -p "Are you sure start ssh server? [y/N]" -e startsshserver
    printf "${RESET}%s"

    if [[ "$startsshserver" == y ]] && [[ "$startsshserver" == Y ]]; then
        printf "${SKYBLUE}%s${RESET}\n" "Enable sshd server for you ..."
        sudo systemctl enable sshd.service
        sudo systemctl start sshd.service
        printf "${BLUE}%s${RESET}\n" "ssh service is started for you."
    fi
}

clone_se7en_repo() {
    local nvimpath="$HOME/.config/nvim"
    if [[ ! -d "$clonepath" ]]; then
        mkdir -p "$HOME/github_upload"
    fi

    local array=(
        # dotfiles
        # se7en-nvim
        chrome_extensions
    )

    for element in "${array[@]}"; do
        # if [[ "$element" -eq dotfile ]]; then
        #     echo -e "$element"
        #     if [[ -d "$HOME/$element" ]]; then
        #         printf "${RED}Dir: $HOME/$element is exeit!${RESET}\n"
        #     else
        #         cd "$HOME" || exit
        #         printf "${BLUE}Cloning $element to $HOME%s${RESET}\n"
        #         git clone https://github.com/lcdse7en/$element
        #
        #     fi
        #
        # elif [[ "$element" -eq se7en-nvim ]]; then
        #     if [[ -d "$nvimpath" ]]; then
        #         printf "Dir: $nvimpath is exeit.${RESET}\n"
        #     else
        #         cd "$HOME/.config" || exit
        #         printf "${BLUE}Cloning $element to $HOME/.config%s${RESET}\n"
        #
        #         # git clone git@github.com:lcdse7en/$element.git nvim
        #         git clone https://github.com/lcdse7en/$element.git nvim
        #     fi
        # else
        cd "$clonepath" || exit
        printf "${BLUE}Cloning $element to ${clonepath}%s${RESET}\n"
        # git clone git@github.com:lcdse7en/$element.git
        git clone https://githubfast.com/lcdse7en/$element.git
        # fi
    done
}

Stow_Dir() {
    local stowtargetdir="$HOME/.config"
    stowfile=(
        hypr
        waybar
        swww
        swaylock
        wlogout
        session
        xsettingsd
        dunst
        kitty
        neofetch
        rofi
        swappy
        lf
        mpd
        ncmpcpp
        smug
        sxiv
        tmux
        smug
        icons
    )
    for element in "${stowfile[@]}"; do
        if [[ ! -d "$stowtargetdir/$element" ]]; then
            cd "$HOME/dotfiles"
            stow $element
        else
            printf "${RED}Dir: $stowtargetdir/${BLUE}$element${RESET}${RED} is exists!${RESET}\n"
        fi
    done
}

Font() {
    local fontsourcedir="$HOME/dotfiles/source/fonts"
    local fonttargetdir="$HOME/.local/share/fonts"

    if [[ ! -d "$fonttargetdir" ]]; then
        mkdir -p "$fonttargetdir"
    fi

    tar -xvzf "$fontsourcedir/Font_CascadiaCove.tar.gz" -C "$fonttargetdir"
    tar -xvzf "$fontsourcedir/Font_MononokiNerd.tar.gz" -C "$fonttargetdir"
    tar -xvzf "$fontsourcedir/Font_JetBrainsMono.tar.gz" -C "$fonttargetdir"
    sudo tar -xvzf "$fontsourcedir/Font_UzumasaMini.tar.gz" -C /usr/share/fonts/

    fc-cache -vf
    fc-list
}

Python() {
    local python_ver="3.11"
    sudo rm -rf /usr/lib/$python_ver/EXTERNALLY-MANAGED*

    local pipconfpath="$HOME/dotfiles/pip/.pip/pip.conf"

    if [[ -f "$pipconfpath" ]]; then
        cd "$HOME/dotfiles"
        stow pip
    else
        printf "${RED}File: $pipconfpath not exists!${RESET}\n"
    fi

    local pip_packages=(
        pandas
        openpyxl
        Scrapy
        aiohttp
        aiofiles
        matplotlib
        rich
        bs4
        fake-useragent
        loguru
        redis
        python-mpd2
        ninja
    )
    for element in "${pip_packages[@]}"; do
        local pipinstalled=$(pip list | grep $element)

        if [[ ! $pipinstalled ]]; then
            printf "${SKYBLUE}%s"
            printf "*%.0s" {1..60}
            printf "${RESET}%s\n"

            printf "${BLUE}Installing $element ...${RESET}\n"

            printf "${SKYBLUE}%s"
            printf "*%.0s" {1..60}
            printf "${RESET}%s\n"

            pip install "$element"

        else
            printf "${RED}$element: ${RESET} is installed on your machine.\n"

        fi

        pip freeze >requirements.txt
        # pip install -r requirements.txt
    done
}

Fcitx5() {
    local fcitx_packages=(
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
    sudo pacman -S --noconfirm "${fcitx_packages[@]}"

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

    local fcitx5confpath="$HOME/.config/fcitx5"
    if [[ ! -d "$fcitx5confpath" ]]; then
        cd "$HOME/dotfiles"
        stow fcitx5
    else
        printf "${RED}Directory $fcitx5confpath already exists.${RESET}\n"

    fi
}

Zsh() {
    printf "${YELLOW}%s"
    read -r -p "Do you want to Install oh-my-zsh on you ArchLinux? [y/N] " answer
    printf "${RESET}%s"

    if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
        printf "${RED}%s"
        printf "Skipping install oh-my-zsh on your machine.\n"
        printf "${RESET}%s"
    else
        sh "$HOME/dotfiles/install-ohmyzsh.sh"
        sleep 1
        sudo rm -rf "$HOME"/.zshrc >/dev/null
        cd "$HOME/dotfiles"
        stow zsh
    fi

    printf "${YELLOW}%s\n"
    read -r -p "Configure oh-my-zsh, Download ohmyzsh plugins? [y/N] " answer
    printf "${RESET}%s"

    if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
        printf "${RED}%s"
        printf "Skipping download ohmyzsh plugins.\n"
        printf "${RESET}%s\n"
    else
        local autosuggestions_dir="$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
        local highlighting_dir="$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
        local autojump_dir="$HOME/.oh-my-zsh/custom/plugins/autojump"
        local vimode_dir="$HOME/.oh-my-zsh/custom/plugins/zsh-vi-mode"
        local you_should_use="$HOME/.oh-my-zsh/custom/plugins/you-should-use"
        local zsh_history_substring_search="$HOME/.oh-my-zsh/custom/plugins/zsh-history-substring-search"

        #  NOTE: zsh-autosuggestions
        if [[ -d "$autosuggestions_dir" ]]; then
            printf "${RED}%s"
            printf "Directory: %s already exists, Skipping cloning.\n" "$autosuggestions_dir"
            printf "${RESET}%s\n"
        else
            printf "$YELLOW%s$RESET\n" "zsh-autosuggestions ..."
            printf "$SKYBLUE*%.0s" {1..50}
            printf "\n"
            git clone https://github.com/zsh-users/zsh-autosuggestions.git \
                "$HOME"/.oh-my-zsh/custom/plugins/zsh-autosuggestions
        fi
        #  NOTE: zsh-syntax-highlighting
        if [[ -d "$highlighting_dir" ]]; then
            printf "${RED}%s"
            printf "Directory: %s already exists, Skipping cloning.\n" "$highlighting_dir"
            printf "${RESET}%s\n"
        else
            printf "$YELLOW%s$RESET\n" "Downloading zsh-syntax-highlighting ..."
            printf "$SKYBLUE*%.0s" {1..50}
            printf "\n"
            git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
                "$HOME"/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
        fi
        #  NOTE: autojump
        if [[ -d "$autojump_dir" ]]; then
            printf "${RED}%s"
            printf "Directory: %s already exists, Skipping cloning.\n" "$autojump_dir"
            printf "${RESET}%s\n"
        else
            printf "$YELLOW%s$RESET\n" "Downloading autojump ..."
            printf "$SKYBLUE*%.0s" {1..50}
            printf "\n"
            git clone https://github.com/wting/autojump.git \
                "$HOME"/.oh-my-zsh/custom/plugins/autojump
        fi
        #  NOTE: zsh-vi-mode
        if [[ -d "$vimode_dir" ]]; then
            printf "${RED}%s"
            printf "Directory: %s already exists, Skipping cloning.\n" "$vimode_dir"
            printf "${RESET}%s\n"
        else
            printf "$YELLOW%s$RESET\n" "Downloading zsh-vi-mode ..."
            printf "$SKYBLUE*%.0s" {1..50}
            printf "\n"
            git clone https://github.com/jeffreytse/zsh-vi-mode.git \
                "$HOME"/.oh-my-zsh/custom/plugins/zsh-vi-mode
            # ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode
        fi
        #  NOTE: you-should-use
        if [[ -d "$you_should_use" ]]; then
            printf "${RED}%s"
            printf "Directory: %s already exists, Skipping cloning.\n" "$you_should_use"
            printf "${RESET}%s\n"
        else
            printf "$YELLOW%s$RESET\n" "Downloading you-should-use ..."
            printf "$SKYBLUE*%.0s" {1..50}
            printf "\n"
            git clone https://github.com/MichaelAquilina/zsh-you-should-use.git \
                "$HOME"/.oh-my-zsh/custom/plugins/you-should-use
            # ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode
        fi
        #  NOTE: zsh-history-substring-search
        if [[ -d "$zsh_history_substring_search" ]]; then
            printf "${RED}%s"
            printf "Directory: %s already exists, Skipping cloning.\n" "$zsh_history_substring_search"
            printf "${RESET}%s\n"
        else
            printf "$YELLOW%s$RESET\n" "Downloading zsh-history-substring-search ..."
            printf "$SKYBLUE*%.0s" {1..50}
            printf "\n"
            git clone https://github.com/zsh-users/zsh-history-substring-search.git \
                "$HOME"/.oh-my-zsh/custom/plugins/zsh-history-substring-search
            # ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode
        fi
    fi
}

main() {
    # Yay_packages
    # Paru_packages
    # Pacman_packages
    # GithubHosts
    # Git_config
    # Ssh-keygen
    # clone_se7en_repo
    # Stow_Dir
    # Font
    Python
    # Fcitx5
    # Zsh
    # CargoMirror
    # Typst
}

main
