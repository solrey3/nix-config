# just is a command runner, Justfile is very similar to Makefile, but simpler.

# TODO update hostname here!
armHostname := "delta"
intelHostname := "charlie"

############################################################################
#
#  Darwin related commands
#
############################################################################

#  TODO Feel free to remove this target if you don't need a proxy to speed up the build process
darwin-set-proxy:
  sudo python3 scripts/darwin_set_proxy.py

# darwin: darwin-set-proxy
darwin-delta: 
  nix build .#darwinConfigurations.delta.system \
    --extra-experimental-features 'nix-command flakes' --impure
  ./result/sw/bin/darwin-rebuild switch --flake .#delta --impure
# darwin-debug: darwin-set-proxy
darwin-delta-debug: 
  nix build .#darwinConfigurations.delta.system --show-trace --verbose \
    --extra-experimental-features 'nix-command flakes' --impure
  ./result/sw/bin/darwin-rebuild switch --flake .#delta --show-trace --verbose --impure

# darwin: darwin-set-proxy
darwin-juliet: 
  nix build .#darwinConfigurations.juliet.system \
    --extra-experimental-features 'nix-command flakes' --impure
  ./result/sw/bin/darwin-rebuild switch --flake .#juliet --impure
# darwin-debug: darwin-set-proxy
darwin-juliet-debug: 
  nix build .#darwinConfigurations.juliet.system --show-trace --verbose \
    --extra-experimental-features 'nix-command flakes' --impure
  ./result/sw/bin/darwin-rebuild switch --flake .#juliet --show-trace --verbose --impure

# darwin: darwin-set-proxy
darwin-charlie: 
  nix build .#darwinConfigurations.charlie.system \
    --extra-experimental-features 'nix-command flakes' --impure
  ./result/sw/bin/darwin-rebuild switch --flake .#charlie --impure
# darwin-debug: darwin-set-proxy
darwin-charlie-debug: 
  nix build .#darwinConfigurations.charlie.system --show-trace --verbose \
    --extra-experimental-features 'nix-command flakes'
  ./result/sw/bin/darwin-rebuild switch --flake .#charlie --show-trace --verbose

nixos-alpha:
  sudo nixos-rebuild switch --flake .#alpha --impure
nixos-alpha-debug:
  sudo nixos-rebuild switch --flake .#alpha --impure --show-trace

nixos-bravo:
  sudo nixos-rebuild switch --flake .#bravo --impure
nixos-bravo-debug:
  sudo nixos-rebuild switch --flake .#bravo --impure --show-trace

nixos-golf:
  sudo nixos-rebuild switch --flake .#golf --impure
nixos-golf-debug:
  sudo nixos-rebuild switch --flake .#golf --impure --show-trace

nixos-india:
  sudo nixos-rebuild switch --flake .#india --impure
nixos-india-debug:
  sudo nixos-rebuild switch --flake .#india --impure --show-trace

home-echo:
  home-manager switch --flake .#echo 

# darwin: darwin-set-proxy
darwin-foxtrot: 
  nix build .#darwinConfigurations.foxtrot.system \
    --extra-experimental-features 'nix-command flakes' --impure
  ./result/sw/bin/darwin-rebuild switch --flake .#foxtrot --impure
# darwin-debug: darwin-set-proxy
darwin-foxtrot-debug: 
  nix build .#darwinConfigurations.foxtrot.system --show-trace --verbose \
    --extra-experimental-features 'nix-command flakes'
  ./result/sw/bin/darwin-rebuild switch --flake .#foxtrot --show-trace --verbose

############################################################################
#
#  nix related commands
#
############################################################################


update:
  nix flake update

history:
  nix profile history --profile /nix/var/nix/profiles/system

gc:
  # remove all generations older than 7 days
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

  # garbage collect all unused nix store entries
  sudo nix store gc --debug


fmt:
  # format the nix files in this repo
  nix fmt

clean:
  rm -rf result
