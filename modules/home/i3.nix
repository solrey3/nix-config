{ lib, config, pkgs, dotfiles, ... }@args:

{

  xsession.enable = true;
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4"; # Windows key
      fonts = { 
        names = [ "JetBrainsMono Nerd Font" ];
        size = 12.0;
      };

      keybindings = {
        "Mod4+Return" = "exec alacritty";
        "Mod4+d" = "exec rofi -show run";
        "Mod4+Shift+q" = "kill";
        "Mod4+Shift+r" = "restart";
        # CHANGE LAYOUTS:
        "Mod4+s" = "layout stacking";  # set stacking layout
        "Mod4+w" = "layout tabbed";    # set tabbed layout
        "Mod4+e" = "layout toggle split"; # toggle between vertical/horizontal split

        # MOVE FOCUS AROUND (optional but nice)
        "Mod4+h" = "focus left";
        "Mod4+j" = "focus down";
        "Mod4+k" = "focus up";
        "Mod4+l" = "focus right";
      };

      bars = [
        {
          statusCommand = "i3status";
          fonts = { 
            names = [ "JetBrainsMono Nerd Font" ];
            size = 12.0;
          };
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

