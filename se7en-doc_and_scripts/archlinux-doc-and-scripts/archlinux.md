# ArchLinux Document

## 1. Install Neovim

```shell
sudo pacman -S bob

# ~/.local/share/bob/nvim-bin

-- nightly version
bob install nightly
bob use nightly

-- Release version
bob install stable
bob use stable

bob list
bob update --all

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

# minute(0-59) hour(0-23) day(1-31) month(1-12) week(0-6)
crontab -e
crontab -l
crontab -r
```

## 4. Install TexLive

[texlive.iso](https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/) <kbd>4.8GiB</kbd>

```shell
sudo mount -o loop texlive.iso /mnt
cd /mnt
sudo ./install-tl
sudo umount /mnt
```
