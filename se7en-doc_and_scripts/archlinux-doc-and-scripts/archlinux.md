# ArchLinux Document

## 1. Install Neovim

```shell
sudo pacman -S bob

-- nightly version
bob install nightly # ~/.local/share/bob/nvim-bin
bob use nightly
nvim --version

-- Release version
bob install stable
bob use stable
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

# minute(0-59) hour(0-23) day(1-31) month(1-12) week(0-6)
crontab -e
crontab -l
crontab -r
```

## 4. Install TexLive

[texlive.iso](https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/)

```shell
sudo mount -o loop texlive.iso /mnt
cd /mnt
sudo ./install-tl
sudo umount /mnt
```
