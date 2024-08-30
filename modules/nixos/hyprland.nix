# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  # That's all you have to do.  
  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # Whether to enable XWayland
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    # If your cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint election apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    hyprland 
    (pkgs.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )
    wlroots
    dunst
    libnotify
    hyprpaper
    swww
    kitty
    alacritty
    rofi-wayland
    dolphin
    wofi
    networkmanagerapplet
    pavucontrol
    pasystray
    cmatrix
    swayidle
  ];

  # For better Wayland support
  # hardware.nvidia.prime.sync.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # services.xserver.enable = true;
  # services.xserver.displayManager.lightdm.enable = true;
  # Enable SDDM as the display manager with Hyprland
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "budchris";

  services.displayManager.sessionPackages = [ pkgs.hyprland ];
  services.displayManager.defaultSession = "hyprland";

}
