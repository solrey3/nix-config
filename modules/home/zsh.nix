{ config, lib, pkgs, ... }: {

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "z" "sudo" "kubectl" ];
    };
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
      hist = "history 1";
      p2 = "cd ~/Nextcloud/obsidian/player2; nvim readme.md";
      nc = "cd ~/nix-config; nvim README.md";
      nano = "nvim";
      neofetch = "fastfetch";
      k = "kubectl";
    };
    initContent = lib.mkBefore ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
  };

  home.packages = with pkgs; [
    zsh
    oh-my-zsh
  ];

}
