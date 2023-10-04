# ArchLinux Document

## 1. Install Neovim

```shell
sudo pacman -S bob
bob install nightly # ~/.local/share/bob/nvim-bin
bob use nightly
nvim --version
```

## 2. mount Udisk

```shell
yay -S udevil
yay -S zenity

sudo systemctl start devmon@se7en
sudo systemctl enable devmon@se7en

devmon -r
```

## 3. crontab

```shell
sudo pacman -S cronie
crontab -e
crontab -l
crontab -r
```
