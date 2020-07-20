{ config, pkgs, ... }:

with pkgs;

let
  python-pkgs = python-packages:
    with python-packages;
    with python3Packages; [
      setuptools
      virtualenv
      wheel
    ];
  python-with-pkgs = python3.withPackages python-pkgs;
in {
  environment.systemPackages = [

    # Internet
    firefox
    openconnect

    # Office
    aspell
    aspellDicts.en
    aspellDicts.fr

    # Programming
    python-with-pkgs

    # System
    cifs-utils
    dialog
    libnfs
    nfs-utils
    openvpn
    pciutils
    unzip
    update-resolv-conf
    wget
    xclip
    zip
  ];

  fonts.fonts = [ dejavu_fonts font-awesome nerdfonts source-code-pro ];
}
