#!/bin/bash

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# nvidia driver
paru -S linux-headers nvidia-580xx-dkms nvidia-580xx-utils lib32-nvidia-580xx-utils
paru -S nvidia-580xx-settings
paru -S opencl-nvidia-580xx lib32-opencl-nvidia-580xx
paru -S intellij-idea-ultimate-edition
