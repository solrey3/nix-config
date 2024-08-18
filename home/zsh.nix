{ ... }: {
  # Zsh configuration
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "z" "sudo" "kubectl" ];
    };
    initExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
      alias k="kubectl"
      alias hist="history 1"
      alias p2="cd ~/Nextcloud/obsidian/player2; nvim todo.md"
      alias dtf="cd ~/dotfiles; nvim"
      alias ll='ls -lh'
      alias la='ls -A'
      alias l='ls -CF'
      alias nano="nvim"
    '';
  };
}
