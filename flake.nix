{
  description = "Nix for NixOS, macOS, and RPi5 configurations";

  # the nixConfig here only affects the flake itself, not the system configuration!
  # nixConfig = {
    # substituters = [
      # Query the mirror of USTC first, and then the official cache.
      # "https://mirrors.ustc.edu.cn/nix-channels/store"
      # "https://cache.nixos.org"
    # ];
  # };

  # This is the standard format for flake.nix. `inputs` are the dependencies of the flake,
  # Each item in `inputs` will be passed as a parameter to the `outputs` function after being pulled and built.
  inputs = {
    nixpkgs-unstable = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-24.05";
    };
    # nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-24.05-darwin";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs dependencies.
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    stylix.url = "github:danth/stylix";
  };

  # The `outputs` function will return all the build results of the flake.
  # A flake can have many use cases and different types of outputs,
  # parameters in `outputs` are defined in `inputs` and can be referenced by their names.
  # However, `self` is an exception, this special parameter points to the `outputs` itself (self-reference)
  # The `@` syntax here is used to alias the attribute set of the inputs's parameter, making it convenient to use inside the function.
  outputs = inputs @ {
    self,
    nixpkgs,
    darwin,
    home-manager,
    stylix,
    ...
  }: let
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

      # Configuration for NixOS Desktop Alpha (x86_64-linux)
      # TODO please change the hostname to your own
      alpha = nixpkgs.lib.nixosSystem {
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
          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            # TODO replace ryan with your own username
            home-manager.users.budchris = import ./home;
            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
	          home-manager.backupFileExtension = "backup";
          }
        ];
      };
      
      # Configuration for NixOS Desktop Bravo (x86_64-linux)
      # TODO please change the hostname to your own
      bravo = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/bravo/configuration.nix
          ./modules/nixos.nix
          ./modules/nixos-nvidia-stable.nix
          # ./modules/nixos-xfce4.nix
          ./modules/nixos-hyprland.nix
          ./modules/linux-apps-gui.nix
          ./modules/linux-apps-gui-x86_64.nix
          stylix.nixosModules.stylix
          ./modules/nixos-stylix.nix
          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            # TODO replace ryan with your own username
            home-manager.users.budchris = import ./home;
            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
	          home-manager.backupFileExtension = "backup";
          }
        ];
      };

    };

    # Configuration for 2017 13-inch MacBook Pro Charlie (x86_64-darwin)
    darwinConfigurations."charlie" = darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      specialArgs = specialArgs // { hostname = "charlie"; };
      modules = [
        ./modules/nix-core.nix
        ./modules/darwin.nix
        ./modules/darwin-apps.nix
        # ./modules/homebrew-mirror.nix # comment this line if you don't need a homebrew mirror
        ./modules/darwin-host-users.nix
        # home manager
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = specialArgs;
          home-manager.users.${username} = import ./home;
        }
      ];
    };

    # Configuration for my M2 Macbook Air Delta (aarch64-darwin)
    darwinConfigurations."delta" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = specialArgs // { hostname = "delta"; };
      modules = [
        ./modules/nix-core.nix
        ./modules/darwin.nix
        ./modules/darwin-apps.nix
        ./modules/darwin-apps-aarch64.nix
        # ./modules/homebrew-mirror.nix # comment this line if you don't need a homebrew mirror
        ./modules/darwin-host-users.nix
        # home manager
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = specialArgs;
          home-manager.users.${username} = import ./home;
        }
      ];
    };

    homeConfigurations = {
      echo = home-manager.lib.homeManagerConfiguration {
        system = "aarch64-linux";
        specialArgs = specialArgs // { hostname = "echo"; };
        modules = [
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = specialArgs;
            home-manager.users.${username} = import ./home;
          }
        ];
      };
    };

    # nix code formatter for both systems
    formatter.x86_64-darwin = nixpkgs.legacyPackages.x86_64-darwin.alejandra;
    formatter.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.alejandra;
    formatter.aarch64-linux = nixpkgs.legacyPackages.aarch64-linux.alejandra;
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
  };
}
