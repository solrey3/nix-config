# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  users.users.budchris = {
    packages = with pkgs; [
      # thunderbird
      pavucontrol
      pasystray
      ## GUI Apps
      picard
      wireshark
      ### darwin or x86_64-linux
      chromedriver 
      google-chrome 
      #### linux only
      conda 
      nextcloud-client 
      vlc 
      #### linux64 only 
      obsidian 
      brave 
      #### x84_64-linux only 
      microsoft-edge 
    ];
  };

}
