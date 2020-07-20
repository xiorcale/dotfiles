{ config, lib, pkgs, ... }:

let
  waybar-pulse = (pkgs.waybar.override { pulseSupport = true; });
in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  programs = {

    alacritty = {
      enable = true;
      settings = {
        font = {
          normal = {
            default = [ "FiraCode Nerd Font" ];
          };
        };
        colors = {
          primary = {
            background = "#282828";
            foreground = "#ebdbb2";
          };
          normal = {
            black = "#282828";
            red = "#cc241d";
            green = "#98971a";
            yellow = "#d79921";
            blue = "#458588";
            magenta = "#b16286";
            cyan = "#689d6a";
            white = "#a89984";
          };
          bright = {
            black = "#928374";
            red = "#fb4934";
            green = "#b8bb26";
            yellow = "#fabd2f";
            blue = "#83a598";
            magenta = "#d3869b";
            cyan = "#8ec07c";
            white = "#ebdbb2";
          };
        };
      };
    };

    bash = {
      enable = true;
      profileExtra = ''
        if [ "$(tty)" = "/dev/tty1" ]; then
          exec dbus-run-session sway
        fi
      '';
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
    };

    mako = {
      enable = true;
      backgroundColor = "#282828";
      borderColor = "#ebdbb2";
      borderRadius = 5;
      defaultTimeout = 5000;
      font = "FiraCode Nerd Font 11";
      textColor = "#ebdbb2";
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

    zathura.enable = true;
  };

  services = {
    redshift = {
      enable = true;
      package = pkgs.redshift-wlr;
      latitude = "46.99";
      longitude = "6.93";
    };
  };

  wayland.windowManager.sway = {
    enable = true;
    config = {
      bars = [
        {
          command = "${waybar-pulse}/bin/waybar";
          position = "top";
        }
      ];

      colors = {
        focused = {
          border = "#282828";
          background = "#282828";
          childBorder = "#282828";
          text = "#ebdbb2";
          indicator = "#282828";
        };
        focusedInactive = {
          border = "#282828";
          background = "#282828";
          childBorder = "#282828";
          text = "#665c54";
          indicator = "#282828";
        };
        unfocused = {
          border = "#282828";
          background = "#282828";
          childBorder = "#282828";
          text = "#665c54";
          indicator = "#282828";
        };
      };

      gaps = {
        inner = 10;
      };

      input = {
        "*" = {
          xkb_layout = "ch";
          xkb_variant = "fr";
        };
        "1739:10608:Touchpad" = { tap = "enabled"; };
      };

      keybindings = let
        brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
        pactl = "${pkgs.pulseaudio}/bin/pactl";
        wob-update = "$HOME/.config/sway/scripts/wobWrapper.sh --update";
        wob-toggle = "$HOME/.config/sway/scripts/wobWrapper.sh --toggle";
      in lib.mkOptionDefault {
        "XF86AudioRaiseVolume" = "exec ${pactl} set-sink-volume @DEFAULT_SINK@ +5% && ${wob-update}";
        "XF86AudioLowerVolume" = "exec ${pactl} set-sink-volume @DEFAULT_SINK@ -5% && ${wob-update}";
        "XF86AudioMute" = "exec ${pactl} set-sink-mute @DEFAULT_SINK@ toggle && ${wob-toggle}";
        "XF86AudioMicMute" = "exec ${pactl} set-source-mute @DEFAULT_SOURCE@ toggle";
        "XF86MonBrightnessDown" = "exec ${brightnessctl} set 5%-";
        "XF86MonBrightnessUp" = "exec ${brightnessctl} set +5%";
      };

      menu = "${pkgs.wofi}/bin/wofi --allow-images --conf=/home/xiorcale/.config/wofi/config --style=/home/xiorcale/.config/wofi/style.css";

      modifier = "Mod4";

      output = {
        "*" = {
          bg = "~/.config/sway/background.png fill";
        };
      };

      startup = [
        { command = "mako"; }
      ];

      terminal = "alacritty";
    };

    extraSessionCommands = ''
      export MOZ_ENABLE_WAYLAND=1
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland-egl
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export _JAVA_AWT_WM_NONREPARENTING=1
      export CLUTTER_BACKEND=wayland
      export ELM_ENGINE=wayland_egl
      export ECORE_EVAS_ENGINE=wayéamd-egl
    '';

    wrapperFeatures = {
      base = true;
      gtk = true;
    };
  };

  home.packages = with pkgs; [
    brightnessctl
    gnome3.adwaita-icon-theme
    pavucontrol
    qt5.qtwayland
    swaybg
    swayidle
    swaylock
    waybar-pulse
    wob
    wofi
  ];

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
