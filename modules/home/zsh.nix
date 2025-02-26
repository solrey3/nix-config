{ config, lib, pkgs, dotfiles, ... }: {
  
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "z" "sudo" "kubectl" ];
    };
  };

  home.file.".zshrc".source = "${dotfiles}/zsh/.zshrc";

}
