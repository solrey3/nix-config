{ pkgs, ... }: {

  ##########################################################################
  # 
  #  Install all apps and packages here.
  #
  #  NOTE: You can find all available options in:
  #    https://daiderd.com/nix-darwin/manual/index.html
  # 
  # TODO Feel free to modify this file to fit your needs.
  #
  ##########################################################################

  # Install packages from Nix's official package repository.
  #
  # The packages installed here are available to all users, are reproducible across machines, and can be rolled back.
  # However, on macOS, it is generally less stable than Homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  environment.systemPackages = with pkgs; [
    vim # Powerful, widely used text editor with a focus on efficiency
    git # Distributed version control system for tracking changes in source code
    just # Command runner and task manager, similar to Makefile, simplifying nix-darwin's commands
    fastfetch # Fast system information tool, similar to Neofetch, for displaying system details
  ];
  environment.variables.EDITOR = "vim"; # Set Vim as the default text editor

  # TODO To make this work, Homebrew needs to be installed manually, see https://brew.sh
  # 
  # The apps installed by Homebrew are not managed by Nix and are not reproducible!
  # However, on macOS, Homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false; # Prevent Homebrew from auto-updating itself
      cleanup = "zap"; # Uninstall all formulae (and related files) not listed here
    };

    # Applications to install from Mac App Store using mas.
    # You need to install all these apps manually first so that your Apple account has records for them.
    # Otherwise, the Apple Store will refuse to install them.
    # For details, see https://github.com/mas-cli/mas 
    masApps = {
      # TODO Feel free to add your favorite apps here.
      Xcode = 497799835; # Apple’s IDE for macOS, required for building software
    };

    taps = [
      "homebrew/services" # Homebrew tap for managing macOS services
    ];

    # `brew install`
    # TODO Feel free to add your favorite apps here.
    brews = [
      "wget" # Command-line utility for downloading files from the web
      "curl" # Command-line tool for transferring data with URLs; do not install via nixpkgs, as it may not work well on macOS
      "aria2" # Advanced command-line download utility that supports multiple protocols
      "httpie" # Command-line HTTP client with a user-friendly interface
    ];

    # `brew install --cask`
    # TODO Feel free to add your favorite apps here.
    casks = [
      # IM & audio & remote desktop & meeting
      "telegram" # Popular messaging app focused on speed and security
      "discord" # Free voice, video, and text chat app, mainly for gamers
      "anki" # Flashcard app for efficient learning and memorization
      "raycast" # Powerful search tool and launcher for macOS, with scripting capabilities
      "stats" # A beautiful system monitor for macOS, providing a range of information at a glance
      "eudic" # 欧路词典, a Chinese-English dictionary application
      # Development
      "insomnia" # REST client for testing and debugging HTTP APIs
      # My Apps
      "1password" # Secure password manager with a strong focus on user-friendly security
      "alacritty" # A fast, cross-platform, OpenGL terminal emulator
      "arc" # Innovative web browser that combines the best features of modern browsers
      "barrier" # Software to share a mouse and keyboard between multiple computers
      "brave-browser" # Privacy-focused web browser with ad-blocking features
      "google-chrome" # Popular web browser known for its speed and simplicity
      "firefox" # Open-source web browser known for its performance and privacy features
      "librewolf" # Fork of Firefox focused on privacy, security, and freedom
      "microsoft-edge" # Chromium-based web browser by Microsoft, with enterprise features
      "musicbrainz-picard" # Music tagging application for organizing digital music collections
      "nextcloud" # Open-source platform for file sync and sharing, similar to Dropbox
      "obsidian" # A powerful knowledge management and note-taking application
      "protonmail-bridge" # Bridges Proton Mail to email clients supporting IMAP and SMTP protocols
      "protonvpn" # Secure and privacy-focused VPN service
      "raspberry-pi-imager" # Tool to write operating system images to SD cards for Raspberry Pi
      "soulseek" # Peer-to-peer file-sharing network, mainly used for sharing music
      "spectacle" # Window management utility for arranging windows in macOS
      "thunderbird" # Free email application that’s easy to set up and customize
      "transmission" # Lightweight, fast, and easy-to-use BitTorrent client
      "visual-studio-code" # Popular source code editor with built-in support for many languages
      "vlc" # Versatile, open-source media player that plays most multimedia files
      "whatsapp" # Desktop client for the popular messaging app
      "wireshark" # Network protocol analyzer for monitoring and analyzing network traffic
    ];

  };
}
