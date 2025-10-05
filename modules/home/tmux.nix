{ config, lib, pkgs, ... }: {

  programs.tmux = {
    enable = true;
    extraConfig = ''
      set -g mouse on
      # Basic tmux configuration
      set -g prefix C-b
      bind-key C-b send-prefix
      
      # Reload config
      bind r source-file ~/.tmux.conf \; display-message "Config reloaded..."
      
      # Split panes using | and -
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind %
      
      # Switch panes using Alt-arrow without prefix
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D
      
      # Enable vi mode
      setw -g mode-keys vi
    '';
  };

}

