{ config, lib, pkgs, dotfiles, ... }: {

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "z" "sudo" "kubectl" "fast-syntax-highlighting" "zsh-syntax-highlighting" "zsh-autocomplete" ];
    };
  };

  home.file.".zshrc".source = "${dotfiles}/zsh/.zshrc";

  home.packages = with pkgs; [
    zsh
    oh-my-zsh
    zsh-syntax-highlighting
    zsh-fast-syntax-highlighting
    zsh-autocomplete
  ];

}
