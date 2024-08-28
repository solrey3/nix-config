
# nix-config

What you have here is a Nix flake that provides configuration for every Linux and macOS computer I manage and development shell environments. This flake will work on any computer with Nix installed.

### Features

This Nix flake serves two main functions:

1. **System Configuration**: It provides configuration for every computer I manage. If the machine can run Nix, then flakes can handle the configuration, making it easy to maintain consistency across different environments.
2. **Development Shell Environments**: It provides development shell environments for various programming languages and tools, ensuring that all dependencies are readily available and configured correctly.

## Install Nix

### Install NixOS
For installing NixOS, visit the official [NixOS download page](https://nixos.org/download/#nix-more) and follow the instructions.

### Install Nix on macOS
To install Nix on macOS, run the following command:
```sh
sh <(curl -L https://nixos.org/nix/install)
```

### Install Nix on Linux

#### Multi-user installation (recommended)
If you are on Linux running systemd, with SELinux disabled and can authenticate with sudo, it is recommended to install Nix via the multi-user installation:
```sh 
sh <(curl -L https://nixos.org/nix/install) --daemon
```

#### Single-user installation
If multi-user installation is not an option, you can install Nix via the single-user installation:
```sh 
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```
This command performs a single-user installation, meaning Nix is owned by the invoking user. Run this under your usual user account, not as root. The script will invoke sudo to create `/nix` if it doesn’t already exist.

## Configure Nix To Use Flakes

To use Nix flakes, ensure that your `nix.conf` file is configured to enable flakes:

```sh
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

## Managed Hosts

- `alpha` - NixOS 24.05 with XFCE running on Intel Core i5-3570k with NVIDIA GeForce GTX 660.
- `bravo` - NixOS 24.05 with Hyprland running on AMD Ryzen 9 3900X with NVIDIA GeForce RTX 3070.
- `charlie` - macOS Ventura 13.6.9 on 2017 Intel 13-inch MacBook Pro.
- `delta` - macOS Sonoma 14.6.1 on 2022 M2 13-inch MacBook Air.
- `echo` - Raspberry Pi OS with Nix on Raspberry Pi 5.
- `foxtrot` - Steam Deck.

## Update Hosts

To update the configuration on a host, use the provided Justfile to run the commands needed to apply updates and ensure the latest configurations are applied.

## Modules

### System Modules
- `darwin/`
  - `system`
  - `apps`
  - `apps-aarch64`
  - `host-users`
- `linux/`
  - `apps-gui`
  - `apps-gui-x86_64`
- `nixos/`
  - `base`
  - `hyprland`
  - `nvidia-legacy_470`
  - `nvidia-stable`
  - `stylix`
  - `xfce4`

### Home Modules
- `home/`
  - `default`
  - `core`
  - `zsh`
  - `bash`
  - `alacritty`
  - `git`
  - `neovim`
  - `ssh`
  - `starship`
  - `tmux`

## DevShells

Development shell environments are provided for the following languages and tools:

- `github-pages` 
- `kali-linux`
- `python-data-science`
- `python-fasthtml`
- `typescript-devops`

These shells include all necessary dependencies and tools to start developing in these environments immediately.

## Activate a DevShell

With Nix installed, the best way to activate a DevShell is to use the `nix develop` command on the GitHub repository:

```sh
nix develop github:solrey3/nix-config#python-data-science
```

This command will load the specified development environment with all the tools and dependencies defined in the flake.

