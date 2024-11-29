{ pkgs, ... }:

{
  home.packages = with pkgs; [
    
    ## Remote Desktop Protocol
    freerdp 
    remmina 
    ## GUI Applications
    thunderbird
    protonmail-bridge-gui
    quodlibet
    picard
    transmission-gtk
    wireshark
    protonvpn-gui
    nextcloud-client 
    vlc 
    #### linux64 only 
    obsidian 
    brave 
    vscode

  ];
}
