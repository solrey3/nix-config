{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [

    nodejs
    yarn
    inputs.zen-browser.packages."${system}".default
    ## Remote Desktop Protocol
    freerdp
    remmina
    ## GUI Applications
    librewolf
    thunderbird
    protonmail-bridge-gui
    quodlibet
    picard
    transmission_4-gtk
    wireshark
    protonvpn-gui
    nextcloud-client
    vlc
    #### linux64 only
    brave
    vscode

  ];
}
