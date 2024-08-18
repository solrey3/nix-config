{ ... }: {
  
  home.file = {
    ".config/nvim".source = ./dotfiles/nvim;
  };

  # modern vim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
