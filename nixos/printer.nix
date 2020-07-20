{ config, pkgs, ... }:

with pkgs;

{
  services = {

    # automatic printers discovery
    avahi = {
      enable = true;
      nssmdns = true;
    };

    printing = {
      enable = true;
      drivers = [ gutenprint ];
    };
  };
}

