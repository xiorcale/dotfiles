#!/bin/bash


sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save

# nvidia driver
yay linux-headers nvidia-580xx-dkms
