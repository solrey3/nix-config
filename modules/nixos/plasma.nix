{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    xkb.layout = "us";
    xkb.variant = "";
  };

  services.displayManager.defaultSession = "plasma";

  # Optional: common packages for KDE
  users.users.budchris = {
    packages = with pkgs; [
      kdePackages.kdeplasma-addons
      pavucontrol
      pasystray
      gnome-keyring
      pinentry-all
    ];
  };
}
