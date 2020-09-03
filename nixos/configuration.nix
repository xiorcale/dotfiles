{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./gnome.nix
      ./packages.nix
      ./printer.nix
    ];

  ########################
  # System Configuration #
  ########################

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    supportedFilesystems = [ "ntfs" ];
  };

  console.useXkbConfig = true;

  i18n = { defaultLocale = "en_US.UTF-8"; };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;

    useDHCP = false;
    interfaces = {
      enp8s0.useDHCP = true;
      wlp7s0.useDHCP = true;
    };

    firewall.allowedTCPPorts = [ 139 445 5000 ]; # samba
  };

  time.timeZone = "Europe/Zurich";

  ##########################
  # Hardware Configuration #
  ##########################

  hardware = {
    bluetooth.enable = true;

    #nvidia.prime.sync.enable = true;
    #nvidia.prime.nvidiaBusId = "PCI:1:0:0";
    #nvidia.prime.intelBusId = "PCI:0:2:0";

    opengl.driSupport = true;

    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
    };
  };

  virtualisation.docker.enable = true;

  ##########################
  # Services configuration #
  ##########################

  services = {

    flatpak.enable = true;

    geoclue2.enable = true;

    samba.enable = true;

    xserver = {
      enable = true;
      layout = "ch";
      xkbOptions = "eurosign:e";
      xkbVariant = "fr";

      libinput.enable = true; # enable trackpad

      #displayManager.lightdm.enable = true;

      #videoDrivers = [ "nvidia" ];
    };
  };

  ######################
  # User configuration #
  ######################

  users.users.xiorcale = {
    isNormalUser = true;
    home = "/home/xiorcale";
    description = "xiorcale";
    extraGroups = [ "audio" "docker" "networkmanager" "video" "wheel" ];
  };

  ######################
  # Misc configuration #
  ######################

  environment = {
    variables = {
      PATH = "/home/xiorcale/.scripts";
      EDITOR = "nvim";
    };
  };
  #programs.sway.enable = true;

  xdg.portal.enable = true;

  nixpkgs.config.allowUnfree = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}

