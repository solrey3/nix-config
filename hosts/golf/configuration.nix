{ modulesPath, config, lib, pkgs, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disk-config.nix
  ];
  boot.loader.grub = {
    # no need to set devices, disko will add all devices that have a EF02 partition to the list already
    # devices = [ ];
    efiSupport = true;
    efiInstallAsRemovable = true;
  };
  services.openssh.enable = true;

  environment.systemPackages = map lib.lowPrio [
    pkgs.curl
    pkgs.gitMinimal
  ];

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFtQcMtGB55jBNuxxvlKXfeYLhy0wsPtIVt2KorpgXhQ budchris@alpha"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFm804g6IUQO1ELH716hLjTBj3zzzbuOUbL3jCE7Gej8 budchris@bravo"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHDwRpWc0JaniB1yBdKNkS5srLkCE67y+sI4Sn+wL55L budchris@charlie"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINNTDemhkFYx8kw6p096XBVp7H2gnONZLMX+4uDgwue/ budchris@delta"
  ];

  system.stateVersion = "24.05";
}
