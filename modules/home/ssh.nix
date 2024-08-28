{ ... }: {

  programs.ssh = {
    enable = true; # Ensure SSH is enabled.
    startAgent = true; # Start the ssh-agent on login.   
    addKeys = [ 
      "~/.ssh/id_ed25519" 
      "~/.ssh/google_compute_engine" 
    ];
    extraConfig = ''

      Host github.com
        User git
        IdentityFile ~/.ssh/id_ed25519
        IdentitiesOnly yes
        StrictHostKeyChecking no
        UserKnownHostsFile=/dev/null

      Host alpha
        HostName alpha.local
        User budchris
        IdentityFile ~/.ssh/id_ed25519
    
      Host bravo
        HostName bravo.local
        User budchris
        IdentityFile ~/.ssh/id_ed25519
    
    '';
  };

}
