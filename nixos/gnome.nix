{ config, pkgs, ... }:

{
  services.xserver = {
    desktopManager.gnome3.enable = true;
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = true;
  };

  environment = {
    gnome3.excludePackages = with pkgs.gnome3; [
      accerciser
      evolution
      epiphany
      gnome-nettool
      gnome-packagekit
      gnome-power-manager
      gnome-remote-desktop
      gnome-software
      gnome-todo
      gnome-usage
      gnome-weather
      vinagre
    ];
  };
}
