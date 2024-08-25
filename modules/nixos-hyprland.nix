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
    waybar
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
  ];

  boot.extraModprobeConfig = ''
    options nvidia NVreg_PreserveVideoMemoryAllocations=1
  '';

  services.xserver.videoDrivers = [ "nvidia" ];

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

  # Install firefox. ??Should this be here??
  programs.firefox.enable = true;

  # Stylix
  stylix.base16Scheme = "{pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
      name = "JetBrainsMono Nerd Font Mono";
    };
    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };
  };
  stylix.fonts.sizes = {
    applications = 12;
    terminal = 10;
    desktop = 10;
    popups = 10;
  };
  stylix.opacity = {
    applications = 1.0;
    terminal = 1.0;
    desktop = 1.0;
    popups = 1.0;
  };
  stylix.polarity = "dark"; # "light" or "either"

}
