{ pkgs, ... }:

{
  home.packages = with pkgs; [

    ## GUI Applications
    
    thunderbird
    protonmail-bridge-gui
    quodlibet
    picard
    transmission
    wireshark
    #### linux only
    # librewolf
    protonvpn-gui
    nextcloud-client 
    vlc 
    #### linux64 only 
    obsidian 
    brave 

  ];
}
