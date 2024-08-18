{ ... }: {
  # Bash configuration
  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your custom bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
      alias hist="history 1"
      alias p2="cd ~/Nextcloud/obsidian/player2; nvim todo.md"
      alias dtf="cd ~/dotfiles; nvim"
      alias ll='ls -lh'
      alias la='ls -A'
      alias l='ls -CF'
      alias nano="nvim"
    '';
    # set some aliases, feel free to add more or remove some
    shellAliases = {
      k = "kubectl";
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    };
  };
}
