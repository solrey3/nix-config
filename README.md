# nix-config
My valiant attempt at a Nix config for all my linux and mac systems.

## Install Nix 

### Install NixOS 
https://nixos.org/download/#nix-more

### Install Nix on MacOS

```sh
sh <(curl -L https://nixos.org/nix/install)
```

### Install Nix on Linux

#### Multi-user installation (recommended)
Install Nix via the recommended multi-user installation:

```sh 
sh <(curl -L https://nixos.org/nix/install) --daemon
```
We recommend the multi-user install if you are on Linux running systemd, with SELinux disabled and you can authenticate with sudo.

#### Single-user installation
Install Nix via the single-user installation:

```sh 
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```
Above command will perform a single-user installation of Nix, meaning that nix is owned by the invoking user. You should run this under your usual user account, not as root. The script will invoke sudo to create /nix if it doesn’t already exist.

## Modules
- `home`/ 
  - `default` 
  - `core` 
  - `zsh`
  - `bash`
  - `alacritty` 
  - `git`
  - `neovim`
  - neovim / 
  - `ssh` 
  - `starship`
  - `tmux`
- `modules`
  - `darwin`
  - `darwin-apps` 
  - `darwin-apps-aarch64`
  - `darwin-host-users` 
  - `linux-apps-gui` 
  - `linux-apps-gui-x86_64` 
  - `nix-core` 
  - `nixos` 
  - `nixos-hyprland` 
  - `nixos-nvidia-legacy_470` 
  - `nixos-nvidia-stable` 
  - `nixos-stylix`
  - `nixos-xfce4` 

## Managed Hosts
- `alpha` - NixOS 24.05 with XFCE running on Intel Core i5-3570k with NVIDIA GeForce GTX 660
- `bravo` - NixOS 24.05 with Hyprland running on AMD Ryzen 9 3900X with NVIDIA GeForce RTX 3070
- `charlie` - MacOS Ventura 13.6.9 on 2017 Intel 13-inch MacBook Pro 
- `delta` - MacOS Sonoma 14.6.1 on 2022 M2 13-inch MacBook Air
- `echo` - Raspberry Pi OS with Nix on Raspberry Pi 5 

