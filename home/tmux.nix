{ ... }: {
  programs.tmux = {
    enable = true;
    extraConfig = ''
      # Set prefix to Ctrl-a
      unbind C-b
      set-option -g prefix C-a
      bind-key C-a send-prefix

      # Split panes using | and -
      bind | split-window -h
      bind - split-window -v

      # Enable mouse support
      set -g mouse on

      # Reload tmux config
      bind r source-file ~/.tmux.conf \; display "Reloaded!"

      # Set the status bar update interval
      set -g status-interval 60

      # Set vi mode for copy mode
      setw -g mode-keys vi

      # Set the default terminal mode
      set -g default-terminal "screen-256color"
      set-option -ga terminal-overrides ",xterm-256color:Tc"

      # Set pane border colors
      set -g pane-border-style fg=brightblack
      set -g pane-active-border-style fg=brightyellow

      # Resize panes with arrow keys
      bind -r Up resize-pane -U 5
      bind -r Down resize-pane -D 5
      bind -r Left resize-pane -L 5
      bind -r Right resize-pane -R 5

      # Set pane navigation to be compatible with vim-tmux-navigator
      bind-key -n C-h select-pane -L
      bind-key -n C-j select-pane -D
      bind-key -n C-k select-pane -U
      bind-key -n C-l select-pane -R

      # Bind keys for creating and switching windows
      bind c new-window
      bind n next-window
      bind p previous-window
      bind w choose-window

      # Save the last session
      set -g set-titles on
      set -g set-titles-string "#T"

      # Automatically set window titles
      setw -g automatic-rename on
      setw -g automatic-rename-format "#W"

      # History limit
      set-option -g history-limit 5000

      # Key bindings to switch between sessions
      bind-key s choose-tree

      # Optional: Key binding to quickly switch between recent sessions
      bind -n M-1 choose-tree -s
      bind -n M-2 choose-tree -s
      bind -n M-3 choose-tree -s

      # Catppuccin Mocha theme settings
      set -g status-bg "#1E1E2E"
      set -g status-fg "#CDD6F4"
      set -g pane-border-style fg="#585B70"
      set -g pane-active-border-style fg="#CDD6F4"

      # Status line colors
      set -g status-left "#[fg=#FAB387,bg=#1E1E2E,bold] #S #[fg=#1E1E2E,bg=#FAB387,nobold,nounderscore,noitalics]"
      set -g status-right "#[fg=#1E1E2E,bg=#FAB387,nobold,nounderscore,noitalics]#[fg=#CDD6F4,bg=#FAB387] %Y-%m-%d #[fg=#FAB387,bg=#FAB387,nobold,nounderscore,noitalics]#[fg=#CDD6F4,bg=#FAB387] %H:%M:%S #[fg=#FAB387,bg=#FAB387,nobold,nounderscore,noitalics]#[fg=#CDD6F4,bg=#FAB387] #(whoami)@#H "

      # Active window status style
      setw -g window-status-current-format "#[fg=#1E1E2E,bg=#FAB387,bold]#[fg=#CDD6F4,bg=#FAB387,bold] #I:#W #[fg=#FAB387,bg=#1E1E2E,nobold]"

      # Inactive window status style
      setw -g window-status-format "#[fg=#CDD6F4,bg=#1E1E2E,nobold] #I:#W #[fg=#1E1E2E,bg=#1E1E2E,nobold]"

      # Set the appearance of the status line
      set -g status-justify centre
      set -g status-left-length 60
      set -g status-right-length 90

      if-shell 'uname | grep -q Darwin' 'bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -selection clipboard -in"'
    '';
  };
}

