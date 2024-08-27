{
  description = "Nix for NixOS, macOS, and RPi5 configurations";

  inputs = {
    nixpkgs-unstable = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-24.05";
    };
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-24.05-darwin";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    stylix.url = "github:danth/stylix";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs @ { self, nixpkgs, flake-utils, darwin, home-manager, stylix, ... }:
    flake-utils.lib.eachSystem [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ] (system:
    let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      # TODO replace with your own username, email, system, and hostname
      username = "budchris";
      useremail = "budchris@solrey3.com";
      specialArgs =
        inputs
        // {
          inherit username useremail;
        };
    in {
      
      nixosConfigurations = {
        alpha = pkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/alpha/configuration.nix
            ./modules/nixos.nix
            ./modules/nixos-nvidia-legacy_470.nix
            ./modules/nixos-xfce4.nix
            ./modules/linux-apps-gui.nix
            ./modules/linux-apps-gui-x86_64.nix
            stylix.nixosModules.stylix
            ./modules/nixos-stylix.nix
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${username} = import ./home;
              home-manager.backupFileExtension = "backup";
            }
          ];
        };

        bravo = pkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/bravo/configuration.nix
            ./modules/nixos.nix
            ./modules/nixos-nvidia-stable.nix
            ./modules/nixos-hyprland.nix
            ./modules/linux-apps-gui.nix
            ./modules/linux-apps-gui-x86_64.nix
            stylix.nixosModules.stylix
            ./modules/nixos-stylix.nix
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${username} = import ./home;
              home-manager.backupFileExtension = "backup";
            }
          ];
        };
      };

      darwinConfigurations = {
        "charlie" = darwin.lib.darwinSystem {
          system = "x86_64-darwin";
          specialArgs = { hostname = "charlie"; };
          modules = [
            ./modules/nix-core.nix
            ./modules/darwin.nix
            ./modules/darwin-apps.nix
            ./modules/darwin-host-users.nix
            home-manager.darwinModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { hostname = "charlie"; };
              home-manager.users.${username} = import ./home;
            }
          ];
        };

        "delta" = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = { hostname = "delta"; };
          modules = [
            ./modules/nix-core.nix
            ./modules/darwin.nix
            ./modules/darwin-apps.nix
            ./modules/darwin-apps-aarch64.nix
            ./modules/darwin-host-users.nix
            home-manager.darwinModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { hostname = "delta"; };
              home-manager.users.${username} = import ./home;
            }
          ];
        };
      };

      homeConfigurations = {
        echo = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgs;
          modules = [
            {
              home.username = "${username}";
              home.stateVersion = "24.05";
              home.homeDirectory = "/home/${username}";
            }
            ./home
          ];
        };
      };

      devShells = {
        python-data-science = import ./devshells/python-data-science.nix { inherit pkgs; };
        python-fasthtml = import ./devshells/python-fasthtml.nix { inherit pkgs; };
        typescript-devops = import ./devshells/typescript-devops.nix { inherit pkgs; };
      };

      formatter = {
        x86_64-darwin = pkgs.alejandra;
        aarch64-darwin = pkgs.alejandra;
        aarch64-linux = pkgs.alejandra;
        x86_64-linux = pkgs.alejandra;
      };

    });

}
