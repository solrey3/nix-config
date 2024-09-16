{ pkgs, ... }:

{
  home.packages = with pkgs; [

    ### darwin or linux64 
    vscode
    ### darwin or x86_64-linux
    chromedriver 
    google-chrome
    synology-drive-client
    #### x84_64-linux only 
    microsoft-edge 
    soulseekqt

  ];
}
