# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  users.users.budchris = {
    packages = with pkgs; [
      ### darwin or linux64 
      vscode
      ### darwin or x86_64-linux
      chromedriver 
      google-chrome 
      #### x84_64-linux only 
      microsoft-edge 
      soulseekqt 
    ];
  };

}
