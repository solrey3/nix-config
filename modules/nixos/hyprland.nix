{ config, pkgs, ... }:

{
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    waylandSupport = true; # Explicitly enabling Wayland support
  };

  # Set environment variables for better Wayland and Hyprland performance
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";  # Fix for invisible cursor issue
    NIXOS_OZONE_WL = "1";           # Hint to use Wayland for certain applications
    XDG_CURRENT_DESKTOP = "Hyprland";  # Set the desktop environment
    MOZ_ENABLE_WAYLAND = "1";       # Enable Wayland for Firefox
    QT_QPA_PLATFORM = "wayland";    # Use Wayland for Qt applications
    _JAVA_AWT_WM_NONREPARENTING = "1"; # Improve Java app compatibility with Wayland
  };

  # Essential packages for Hyprland and Wayland environment
  environment.systemPackages = with pkgs; [
    hyprland                     # Compositor and window manager for Wayland
    (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )                            # Highly customizable status bar for Wayland
    wlroots                      # Modular Wayland compositor library
    dunst                        # Lightweight notification daemon
    libnotify                    # Library for sending desktop notifications
    hyprpaper                    # Wallpaper manager for Hyprland
    swww                         # Wallpaper daemon with support for animated wallpapers
    kitty                        # Fast, feature-rich, GPU-based terminal emulator
    alacritty                    # Another GPU-accelerated terminal emulator
    rofi-wayland                 # Window switcher, application launcher, and dmenu replacement for Wayland
    dolphin                      # KDE file manager, providing a graphical interface for managing files
    wofi                         # Simple application launcher and dmenu replacement for Wayland
    networkmanagerapplet         # GUI applet for managing network connections
    pavucontrol                  # GTK-based volume control tool for PulseAudio
    pasystray                    # System tray icon for managing PulseAudio volume
    cmatrix                      # Console-based "Matrix" effect screensaver
    swayidle                     # Idle management daemon for Wayland (e.g., to dim screen or lock)
    swaylock                     # Screen locker for Wayland
    grimshot                     # Screenshot utility for Wayland
    wayvnc                       # VNC server for Wayland
  ];

  # Enable XDG portals for better compatibility with Flatpak and sandboxed apps
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-wlr ];

  # Enable SDDM as the display manager with Wayland and set Hyprland as default session
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "budchris";
  services.displayManager.sessionPackages = [ pkgs.hyprland ];
  services.displayManager.defaultSession = "hyprland";

  # Optional: Enable NVIDIA Prime Sync for better performance on hybrid graphics setups
  # hardware.nvidia.prime.sync.enable = true;

  # Optional: Enable LightDM instead of SDDM if you prefer
  # services.xserver.enable = true;
  # services.xserver.displayManager.lightdm.enable = true;

}
