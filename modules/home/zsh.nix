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
      alias hist="history 1"\
      alias k="kubectl"
      alias l='ls -CF'
      alias la='ls -A'
      alias ll='ls -lh'
      alias nano="nvim"
      alias nc="cd ~/Repos/github.com/solrey3/nix-config/; nvim README.md"
      alias p1="~/Repos/github.com/solrey3/nix-config/scripts/tmux_startup.sh"
      alias p2="cd ~/Nextcloud/obsidian/player2; nvim todo.md"
      alias urldecode="python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'"
      alias urlencode="python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'"
    '';
  };
}
