# ./configuration.nix
{ config, pkgs, lib, ... }: {

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };
  
  users.users.root = {
    # Altough optional, setting a root password allows you to
    # open a terminal interface in DO's website.
    hashedPassword = 
      "$y$j9T$PoDmvR1yaq1TMjXKNbcXU/$La4lHTuWNpVrI6uX52DZMwghn88spk3QlcHX0vaWsY7";
  };
  
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFtQcMtGB55jBNuxxvlKXfeYLhy0wsPtIVt2KorpgXhQ budchris@alpha"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFm804g6IUQO1ELH716hLjTBj3zzzbuOUbL3jCE7Gej8 budchris@bravo"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHDwRpWc0JaniB1yBdKNkS5srLkCE67y+sI4Sn+wL55L budchris@charlie"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINNTDemhkFYx8kw6p096XBVp7H2gnONZLMX+4uDgwue/ budchris@delta"
  ];

  # You should always have some swap space,
  # This is even more important on VPSs
  # The swapfile will be created automatically.
  swapDevices = [{
    device = "/swap/swapfile";
    size = 1024 * 2; # 2 GB
  }];

  system.stateVersion = "24.05"; # Never change this
}
