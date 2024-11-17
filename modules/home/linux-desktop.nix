{ lib, config, pkgs, dotfiles, ... }@args:

let
  username = "budchris"; # Ensure that the username is defined here
in
{
  # Import sub-modules
  imports = [
    ./zsh.nix
    ./bash.nix
    ./core.nix
    ./git.nix
    ./starship.nix
    ./wezterm.nix
    ./alacritty.nix
    ./tmux.nix
    ./neovim.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = username;
    # homeDirectory = if system == "x86_64-linux" || system == "aarch64-linux"
                    # then "/home/${username}"
                    # else "/Users/${username}";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "24.05";
  };

  # GNU Stow Alternative
  home.file."hypr/hyprland.conf".source = "${dotfiles}/hypr/hyprland.conf"; 
  home.file."waybar".source = "${dotfiles}/waybar"; 

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Install firefox. 
  programs.firefox.enable = true;

}
