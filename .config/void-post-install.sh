#!/bin/bash

clear

# acquire sudo rights
sudo -v

echo "Upgrading the system..."
# 2x in case xbps is upgrading itself the first time
sudo xbps-install -Syu
sudo xbps-install -Syu

echo "Installing packages..."
sudo xbps-install -y \
    void-repo-nonfree \
    intel-ucode intel-video-accel mesa-dri \
    adwaita-icon-theme alacritty brightnessctl elogind firefox mako \
    pavucontrol qt5-wayland sway swaybg swayidle swaylock waybar wayland wofi \
    ffmpeg gstreamer1 gst-plugins-base1 gst-plugins-good1 gst-plugins-bad1 \
    gst-plugins-ugly1 pulseaudio \
    xorg-fonts font-awesome5 \
    git neovim python3 python3-pip python3-setuptools python3-wheel \
    fzf htop neofetch ripgrep starship xtools

echo "Post-install reconfiguration..."
# Intel Microcode reconfiguration
KERNEL_VERSION=$(uname -r)
KERNEL_VERSION=${KERNEL_VERSION:0:3}
sudo xbps-reconfigure --force linux$KERNEL_VERSION

echo "Configuring font settings..."
sudo ln -s /usr/share/fontconfig/conf.avail/10-hinting-slight.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/50-user.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/

echo "Setting up services..."
sudo rm -f /var/service/agetty-tty{3,4,5,6}
sudo rm -f /var/service/acpid  # conflict with elogind
sudo ln -s /etc/sv/dbus /var/service/

