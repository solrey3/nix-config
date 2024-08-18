{ ... }: {
  # Zsh configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "z" "sudo" "kubectl" ];
    };
    initExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
      alias k="kubectl"
      alias urldecode="python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'"
      alias urlencode="python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'"
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
