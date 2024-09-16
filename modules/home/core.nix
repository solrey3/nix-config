{ pkgs, ... }:

{
  home.packages = with pkgs; [

    ## Fonts
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })  # Nerd Font with JetBrains Mono
    ## CLI Tools 
    cbonsai       # Bonsai tree generator
    cowsay        # Configurable speaking/thinking cow
    cmatrix       # Simulates the display from "The Matrix"
    curl          # For making HTTP requests and downloading files
    fastfetch     # Fast system information tool written in C
    figlet        # Banner generator
    file          # Determine file type
    fortune       # Print a random, hopefully interesting, adage
    fzf           # Command-line fuzzy finder
    gawk          # GNU awk utility
    gcc           # GNU Compiler Collection
    gnupg         # GNU Privacy Guard
    gnused        # GNU version of the sed stream editor
    gnutar        # GNU version of the tar archiving utility
    htop          # Interactive process viewer
    jq            # Lightweight and flexible command-line JSON processor
    just          # Handy command runner
    lazygit       # Simple terminal UI for git commands
    lsof          # List open files
    mc            # Midnight Commander, a file manager
    nnn           # Terminal file manager
    ripgrep       # Recursively searches directories for a regex pattern
    speedtest-cli # Internet speed testing tool
    stow          # Symlink farm manager
    tmux          # Terminal multiplexer
    tokei         # Counts code, comments, and blanks lines
    tree          # Displays directories as trees (with optional color/HTML output)
    util-linux    # Miscellaneous system utilities (includes uuidgen)
    wget          # Network downloader
    which         # Shows the full path of shell commands
    ## Archives and Compression Tools
    p7zip         # File archiver with high compression ratio
    unzip         # Decompression utility for .zip files
    xz            # Lossless data compression tool
    zip           # Compression utility
    ## Security Tools
    _1password    # Password Manager
    bitwarden-cli # Password Manager
    nmap              # Network exploration and security auditing utility
    ## Multimedia Tools
    ffmpeg        # A complete solution to record, convert, and stream audio and video
    yt-dlp        # A YouTube downloader with additional features and bug fixes
    ## Cloud Platform CLIs
    awscli2       # AWS Command Line Interface
    azure-cli     # Azure Command Line Interface
    doctl         # DigitalOcean Command Line Interface
    (google-cloud-sdk.withExtraComponents [google-cloud-sdk.components.gke-gcloud-auth-plugin]) # Google Cloud SDK with GKE Auth Plugin

  ];

  # GitHub CLI configuration
  programs.gh = {
    enable = true;
  };
}
