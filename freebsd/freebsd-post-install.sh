#!/bin/sh

USER=$1

add_if_not_present() {
    local value="$1"
    local file="$2"

    if [ -f "$file" ] && grep -q "$value" "$file"; then
        echo "[skip] $value already present in $file"
    else
        echo "$value" >> "$file"
    fi
}

if [ -z $USER ]
then
    echo 'please, give a username as argument'
    exit 1
fi

if [ "$(id -u)" -ne 0 ]; then
    echo "please, start the script with root access"
    exit 1
fi

# use current repo instead of quarterly
echo
echo 'switch repositoy from quarterly to latest'
mkdir -p /usr/local/etc/pkg/repos
cp /etc/pkg/FreeBSD.conf /usr/local/etc/pkg/repos/FreeBSD.conf
sed -i -e 's/quarterly/latest/g' /usr/local/etc/pkg/repos/FreeBSD.conf

# upgrade packages and system security patches
echo
echo 'update packages and system securiy patches'
pkg update -f & pkg upgrade -y
freebsd-update fetch
freebsd-update install

# install Intel and Nvidia graphic drivers
echo
echo 'install Intel and Nvidia graphic drivers'
pkg install -Uy drm-kmod nvidia-drm-kmod

sysrc kld_list+=i915kms
sysrc kld_list+=nvidia-drm

add_if_not_present 'hw.nvidiadrm.modeset="1"' /boot/loader.conf

# install KDE
echo
echo 'instal KDE plasma'
pw groupmod video -m $USER

pkg install -Uy seatd plasma6-plasma ark dolphin kcalc konsole okular

sysrc dbus_enable="YES"
sysrc seatd_enable="YES"

add_if_not_present 'net.local.stream.recvspace=65536' /etc/sysctl.conf
add_if_not_present 'net.local.stream.sendspace=65536' /etc/sysctl.conf

add_if_not_present 'alias kde="/usr/local/bin/ck-launch-session /usr/local/lib/libexec/plasma-dbus-run-session-if-needed /usr/local/bin/startplasma-wayland"' /home/$USER/.shrc

# configure doas
echo
echo 'configure doas'
pkg install -Uy doas
add_if_not_present 'permit nopass keepenv :wheel' /usr/local/etc/doas.conf

# bootloader config
echo
echo 'configure bootloader'
add_if_not_present 'autoboot_delay=5' /boot/loader.conf
add_if_not_present 'loader_logo="beastie"' /boot/loader.conf

# apps
echo
echo 'install basic applications'
pkg install -Uy git firefox helix vscode intellij-ultimate

# mount /proc for convenience
echo
echo 'mount /proc'
add_if_not_present 'proc /proc procfs rw 0 0' /etc/fstab

# end message
echo
echo 'Post-intall successful. Please reboot your computer'
echo