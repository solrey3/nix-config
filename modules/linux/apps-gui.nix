# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  users.users.budchris = {
    packages = with pkgs; [
      # thunderbird
      quodlibet
      picard
      transmission
      wireshark
      #### linux only
      conda 
      nextcloud-client 
      vlc 
      #### linux64 only 
      obsidian 
      brave 
    ];
  };

}