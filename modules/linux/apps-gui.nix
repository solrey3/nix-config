# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  users.users.budchris = {
    packages = with pkgs; [
      screen
      pass
      gnome-keyring
      pinentry-all
      librewolf
      thunderbird
      protonmail-bridge-gui
      quodlibet
      picard
      transmission-gtk
      wireshark
      #### linux only
      # librewolf
      nextcloud-client
      vlc
      #### linux64 only
      obsidian
      brave
    ];
  };

}
