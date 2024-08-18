{ config, pkgs, ... }: {
  
  # modern vim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraConfig = ''
      vim.g.mapleader = " "
      vim.g.maplocalleader = " "
      -- Set to true if you have a Nerd Font installed and selected in the terminal
      vim.g.have_nerd_font = true
    '';
    extraLuaConfig = ''
      -- Add your custom Lua directory to the runtime path
      vim.opt.runtimepath:append("./neovim")
      -- Require Lua files from the lua directory
      require('config')
      require('plugins')
    '';
    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-airline
      LazyVim
    ];
  };
}
