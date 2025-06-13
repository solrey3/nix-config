{ lib, config, pkgs, dotfiles, ... }@args:

{

  xsession.enable = true;
  xsession.windowManager.i3 = {
    enable = true;
  };

  # Use configuration from the dotfiles repository
  xdg.configFile."i3/config".source = lib.mkForce "${dotfiles}/i3/config";

  home.packages = with pkgs; [
    i3
    i3status
    dmenu
    rofi
    alacritty
  ];

}

