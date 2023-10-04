#!/usr/bin/bash

#********************************************
# Author      : lcdse7en
# E-mail      : 2353442022@qq.com
# Create_Time : 2023-10-04 19:12
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

Mirrorlist() {
    tee /etc/pacman.d/mirrorlist <<-EOF
	Server = https://mirrors.shanghaitech.edu.cn/archlinux/\$repo/os/\$arch
	Server = https://mirrors.neusoft.edu.cn/archlinux/\$repo/os/\$arch
	Server = https://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch
	Server = https://mirrors.bfsu.edu.cn/archlinux/\$repo/os/\$arch
	Server = https://mirrors.tuna.tsinghua.edu.cn/\$repo/os/\$arch
	EOF
}

Pactrap() {
    pacman -Sy archlinux-keyring
    pacstrap /mnt base linux linux-firmware
    genfstab -U /mnt >>/mnt/etc/fstabs
}

Lang() {
    echo "LANG=en_US.UTF-8" >/mnt/etc/locale.conf
}

Encode() {
    sed -i 's/^#en_US.UTF-8/en_US.UTF-8/' /mnt/etc/locale.gen
}

Hostname() {
    local hostname="se7en-pc"
    echo $hostname >/mnt/etc/hostname
}

Hosts() {
    sudo tee /mnt/etc/hosts <<-EOF
	127.0.0.1 localhost
	::1       localhost
	127.0.0.1 se7en-pc.localdomain se7en-pc
	EOF
}

Arch_chroot() {
    arch-chroot /mnt
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    hwclock --systohc
    locale-gen
    passwd

    array=(
        grub
        efibootmgr
        intel-ucode
        os-prober
        man-db
        wpa_supplicant
        dhcpcd
        networkmanager
    )
    pacman -S "${array[@]}"

    mkdir /boot/grub
    grub-mkconfgi >/boot/grub/grub.cfg
    grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ArchLinux --no-nvram --removable
}

main() {
    # Mirrorlist
    # Pactrap
    # Lang
    # Encode
    # Hostname
    Hosts
}

main
