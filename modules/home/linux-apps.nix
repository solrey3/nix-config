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
    obsidian
    librewolf
    thunderbird
    _1password-gui
    protonmail-bridge-gui
    quodlibet
    picard
    transmission_4-gtk
    wireshark
    nextcloud-client
    vlc
    #### linux64 only
    vscode

  ];
}
