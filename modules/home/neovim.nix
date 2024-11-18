
{ config, lib, pkgs, dotfiles, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    # Install extra Neovim packages
    extraPackages = with pkgs; [
      # LazyVim
      lua-language-server
      stylua
      # Telescope
      ripgrep
    ];
  };

  # Link the Neovim configuration from the dotfiles repository
  home.file.".config/nvim".source = "${dotfiles}/nvim";
}
