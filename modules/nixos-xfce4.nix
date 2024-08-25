# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the XFCE Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "budchris";

  # Install firefox. ??Should this be here??
  programs.firefox.enable = true;

  users.users.budchris = {
    packages = with pkgs; [
      pavucontrol
      pasystray
    ];
  };

  # Stylix
  stylix.base16Scheme = "{pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

}
