[[toc]]

#### 1.Install zsh
```sh
sudo pacman -S zsh git
cat /etc/sheels
chsh -s /bin/zsh
```

#### 2.Install oh-my-zsh
```sh
# curl
sh -c "$(curl -fsSL https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh)"

# wget
sh -c "$(wget -O- https://gitee.com/pocmon/mirrors/raw/master/tools/install.sh)"
```

#### 3.oh-my-zsh plugins
- autosuggestions
```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

- zsh-syntax-highlighting
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

- autojump
```sh
paru -S autojump
```

#### 4.plugins list
```rc
plugins={
    git
    sudo
    zsh-syntax-highlighting
    zsh-autosuggestions
    autojump
    zsh_reload
    tmux
  }
```
`

#### 5.PowerLevel10k
```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/theme/powerlevel10k
```
- set in zshrc
```rc
ZSH_THEME="powerlevel10k/powerlevel10k"
```

- set theme
```sh
p10k configure
```

