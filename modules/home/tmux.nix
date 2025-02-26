{ config, lib, pkgs, dotfiles, ... }: {

  programs.tmux = {
    enable = true;
    extraConfig = ''
      set -g mouse on
    '';
  };

  home.file.".tmux.conf".source = "${dotfiles}/tmux/.tmux.conf"; 

}

