{ config, lib, pkgs, dotfiles, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraPackages = with pkgs; [
      # LazyVim
      lua-language-server
      stylua
      # Telescope
      ripgrep
    ];
  };


  # Normal LazyVim config here, see https://github.com/LazyVim/starter/tree/main/lua
  home.file.".config/nvim".source = "${dotfiles}/nvim";
}
