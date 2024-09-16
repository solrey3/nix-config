{ pkgs, ... }:

{
  home.packages = with pkgs; [

    ## GUI Applications
    screen
    pass
    gnome.gnome-keyring
    pinentry-all
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
