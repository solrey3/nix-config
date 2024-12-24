
# nix-config

This repository contains a Nix flake that provides comprehensive configurations for all Linux and macOS machines I manage, alongside development shell environments. This flake ensures consistent system setups and development experiences across all machines running Nix.

## Features

1. **System Configuration**: Centralized configuration management for all my machines. As long as Nix is installed, flakes handle system setup and maintenance, simplifying consistency across environments.
2. **Development Shell Environments**: Pre-configured development shells for various programming languages and tools, ensuring all necessary dependencies are readily available and correctly set up.

## Installation Instructions

### Installing Nix

#### NixOS
To install NixOS, refer to the official [NixOS download page](https://nixos.org/download/#nix-more) for detailed instructions.

#### macOS
Install Xcode and Homebrew
```sh 
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install Nix on macOS using the following command:
```sh
sh <(curl -L https://nixos.org/nix/install)
```

#### Linux

**Multi-user Installation (Recommended)**

For Linux systems with systemd and SELinux disabled, and where sudo authentication is available:
```sh 
sh <(curl -L https://nixos.org/nix/install) --daemon
```

**Single-user Installation**

If the multi-user installation is not feasible:
```sh 
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```
This installs Nix as a single-user setup, owned by the invoking user. Run it under your usual account, not as root. The script will use sudo to create `/nix` if it doesn’t already exist.

## Enabling Nix Flakes

To enable Nix flakes, add the following configuration to your `nix.conf` file:
```sh
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

## Managed Hosts

- **alpha**: NixOS 24.05 with XFCE, Intel Core i5-3570k, NVIDIA GeForce GTX 660.
- **bravo**: NixOS 24.05 with Hyprland, AMD Ryzen 9 3900X, NVIDIA GeForce RTX 3070.
- **charlie**: macOS Ventura 13.6.9 on 2017 Intel 13-inch MacBook Pro.
- **delta**: macOS Sonoma 14.6.1 on 2022 M2 13-inch MacBook Air.
- **echo**: Raspberry Pi OS with Nix on Raspberry Pi 5.
- **foxtrot**: macOS Catalina 10.15.7 on Early 2013 13-inch Retina Macbook Pro.
- **golf**: NixOS 24.05 on Late-2011 15-inch MacBook Pro.
- **hotel**: NixOS 24.05 on Digital Ocean droplet originally running Ubuntu 
- **india**: SteamOS 3.0 with NixOS dual-boot on Steam Deck.

## Other Configurations
- **digitalocean**: Uses nixos-anywhere to install NixOS on a Linux droplet 

## Updating Hosts/Configurations

To update configurations on any host, utilize the provided Justfile to run the necessary commands, ensuring that all machines have the latest settings applied.

## Module Overview

### System Modules
- **darwin/**
  - `nix-core`
  - `system`: macOS system configuration.
  - `apps`: macOS applications.
  - `apps-aarch64`: Apple Silicon-specific apps.
  - `host-users`: macOS user configuration.
- **linux/**
  - `apps-gui`: GUI applications.
  - `apps-gui-x86_64`: x86_64-specific GUI applications.
- **nixos/**
  - `base`: NixOS base configuration.
  - `hyprland`: NixOS Hyprland configuration.
  - `nvidia-legacy_470`: Legacy NVIDIA driver for GeForce GTX.
  - `nvidia-stable`: Stable NVIDIA driver for GeForce RTX.
  - `xfce4`: Xfce desktop environment.
- **stylix**: Stylix configuration.

### Home Modules
- **home/**
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

#### Dotfiles (Home Configuration Files)

Additional configuration files are available for:
- `hypr`
- `neovim`
- `waybar`

## Development Shells

The following development environments are provided:

- **github-pages**
- **kali-linux**
- **python-data-science**
- **python-fasthtml**
- **typescript-devops**

These shells include all required dependencies and tools, allowing for immediate development in these environments.

## Activating a DevShell

With Nix installed, activate a development environment using the `nix develop` command:

```sh
nix develop github:solrey3/nix-config#python-data-science
```

This command loads the specified development environment, complete with all tools and dependencies defined in the flake.

---

This version is more streamlined and polished while retaining all the key details.
