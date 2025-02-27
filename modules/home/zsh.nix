{ config, lib, pkgs, dotfiles, ... }: {
  
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "z" "sudo" "kubectl" "zsh-syntax-highlighting" "fast-syntax-highlighting" "zsh-autocomplete" ];
    };
  };

  home.file.".zshrc".source = "${dotfiles}/zsh/.zshrc";

  home.packages = with pkgs; [
    oh-my-zsh
  ];

}
