# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  services.xserver = {
    enable = true;   
    desktopManager = {
      xterm.enable = false;
      mate = {
        enable = true;
        # noDesktop = true;
        # enableXfwm = false;
      };
    };
    # windowManager.i3.enable = true;
    xkb.layout = "us";
    xkb.variant = "";
  };
  services.displayManager.defaultSession = "mate";

  # Enable the MATE Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "budchris";

  # Enable network manager applet
  programs.nm-applet.enable = true;

  users.users.budchris = {
    packages = with pkgs; [
      pavucontrol
      pasystray
      barrier
      screen
      pass
      gnome.gnome-keyring
      pinentry-all

    ];
  };

}