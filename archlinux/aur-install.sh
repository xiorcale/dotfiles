#!/bin/bash


sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save

# nvidia driver
yay -S linux-headers nvidia-580xx-dkms nvidia-580xx-utils lib32-nvidia-580xx-utils
yay -S nvidia-580xx-settings
yay -S opencl-nvidia-580xx lib32-opencl-nvidia-580xx
