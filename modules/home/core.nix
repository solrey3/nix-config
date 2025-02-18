{ pkgs, ... }:
{
  home.packages = with pkgs; [

    ## Fonts
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })  # Nerd Font with JetBrains Mono
    ## CLI Tools 
    ## System Tools
    fastfetch     # Fast system information tool written in C
    file          # Determine file type
    tree          # Displays directories as trees (with optional color/HTML output)
    stow          # Symlink farm manager
    lsof          # List open files
    mc            # Midnight Commander, a file manager
    nnn           # Terminal file manager
    ripgrep       # Recursively searches directories for a regex pattern
    fzf           # Command-line fuzzy finder
    gawk          # GNU awk utility
    jq            # Lightweight and flexible command-line JSON processor
    gcc           # GNU Compiler Collection
    gnupg         # GNU Privacy Guard
    gnused        # GNU version of the sed stream editor
    gnutar        # GNU version of the tar archiving utility
    just          # Handy command runner
    which         # Shows the full path of shell commands
    tldr          # Simplified and community-driven man pages
    util-linux    # Miscellaneous system utilities (includes uuidgen)
    ## Monitoring Tools 
    btop          # A monitor of resources
    htop          # Interactive process viewer
    ## Network Tools 
    curl          # For making HTTP requests and downloading files
    wget          # Network downloader
    nmap          # Network exploration and security auditing utility
    rsync         # Fast incremental file transfer utility
    speedtest-cli # Internet speed testing tool
    ## Development Tools 
    lazygit       # Simple terminal UI for git commands
    nodejs        # Event-driven I/O framework for the V8 JavaScript engine
    postgresql    # Object-relational database management system
    tokei         # Counts code, comments, and blanks lines
    yarn          # Fast, reliable, and secure dependency management for javascript
    ## DevOps Tools 
    kubectl       # Kubernetes CLI 
    terraform     # Infrastructure as Code
    kubernetes-helm # The Kubernetes Package Manager
    minikube      # Run Kubernetes locally
    kind          # Run local Kubernetes clusters using Docker container nodes
    act           # Run GitHub Actions locally
    ## Cloud Platform CLIs 
    _1password-cli    # Password Manager
    #bitwarden-cli # Password Manager
    awscli2       # AWS Command Line Interface
    azure-cli     # Azure Command Line Interface
    doctl         # DigitalOcean Command Line Interface
    (google-cloud-sdk.withExtraComponents [google-cloud-sdk.components.gke-gcloud-auth-plugin]) # Google Cloud SDK with GKE Auth Plugin
    ## Fun Tools 
    cbonsai       # Bonsai tree generator
    cowsay        # Configurable speaking/thinking cow
    cmatrix       # Simulates the display from "The Matrix"
    figlet        # Banner generator
    fortune       # Print a random, hopefully interesting, adage
    ## Archives and Compression Tools
    p7zip         # File archiver with high compression ratio
    unzip         # Decompression utility for .zip files
    xz            # Lossless data compression tool
    zip           # Compression utility
    ## Multimedia Tools
    ffmpeg        # A complete solution to record, convert, and stream audio and video
    yt-dlp        # A YouTube downloader with additional features and bug fixes
    ## Python Tools
    python310
    python310Packages.pandas
    python310Packages.python-frontmatter
    python310Packages.mutagen

  ];

  # GitHub CLI configuration
  programs.gh = {
    enable = true;
  };

}
