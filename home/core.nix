{ pkgs, ... }:

{
  home.packages = with pkgs; [
    
    ## Fonts
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })  
    
    ## CLI Tools 
    _1password
    cowsay
    cmatrix
    curl
    fastfetch
    figlet
    file
    fortune
    fzf # A command-line fuzzy finder
    gawk
    gcc
    gnupg
    gnused
    gnutar
    htop
    jq # A lightweight and flexible command-line JSON processor
    just
    lazygit
    lsof # list open files
    mc
    nnn # terminal file manager
    ripgrep # recursively searches directories for a regex pattern
    speedtest-cli
    stow
    tmux
    tokei
    tree
    util-linux # for uuidgen
    wget
    which
    ### archives
    p7zip
    unzip
    vim
    xz
    zip
    ### devops
    docker
    docker-compose
    kubectl
    nmap # A utility for network discovery and security auditing
    terraform
    ### dev environments
    nodejs
    yarn
    nodePackages.cdktf-cli
    nodePackages.cdk8s-cli
    ### multimedia
    ffmpeg
    yt-dlp
    ### cloud platforms
    awscli2
    azure-cli
    doctl
    (google-cloud-sdk.withExtraComponents [google-cloud-sdk.components.gke-gcloud-auth-plugin])
    
    ## GUI Apps
    # quodlibet # Broken
    # picard # Unsupported 
    # transmission
    # wireshark
    
  ];

  # Github CLI configuration
  programs.gh = {
    enable = true;
  };

}
