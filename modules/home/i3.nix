{ lib, config, pkgs, dotfiles, ... }@args:

{

  xsession.enable = true;
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4"; # Windows key
      fonts = [ "pango:JetBrainsMono Nerd Font 12" ];

      keybindings = {
        "Mod4+Return" = "exec alacritty";
        "Mod4+d" = "exec rofi -show run";
        "Mod4+Shift+q" = "kill";
        "Mod4+Shift+r" = "restart";
      };

      bars = [
        {
          statusCommand = "i3status";
          fonts = [ "pango:JetBrainsMono Nerd Font 10" ];
        }
      ];
    };
  };

  home.packages = with pkgs; [
    i3
    i3status
    dmenu
    rofi
    alacritty
  ];

}

