{ config, lib, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  # Gnome configuration
  dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
    };
    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>w" ];
      move-to-workspace-down = [ "<Super><Shift>Down" ];
      move-to-workspace-up = [ "<Super><Shift>Up" ];
      switch-to-workspace-down = [ "<Primary><Super>Down" ];
      switch-to-workspace-up = [ "<Primary><Super>Up" ];
    };
  };

  programs = {

    bash = {
      enable = true;
    };

    bat.enable = true;

    fzf = {
      enable = true;
      enableBashIntegration = true;
    };

    git = {
      enable = true;
      userName = "xiorcale";
      userEmail = "quentin.vaucher@protonmail.com";
      aliases = {
        lola = "log --graph --decorate --pretty=oneline --abbrev-commit --all";
      };
      extraConfig = {
        url = {
          "ssh://git@github.com/" = {
            insteadOf = "https://github.com/";
          };
        };
      };
    };

    neovim = {
      enable = true;
      withPython3 = true;
      withNodeJs = true;
      vimAlias = true;
    };

    starship = {
      enable = true;
      enableBashIntegration = true;
      settings = {
        aws.disabled = true;
        golang.symbol = "ﳑ ";
      };
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "19.09";
}

