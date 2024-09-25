{ pkgs }:

let
  pkgsWithConfig = import pkgs.path {
    config = {
      allowUnfree = true;
    };
    inherit (pkgs) system;
  };
in
pkgsWithConfig.mkShell {
  packages = with pkgsWithConfig; [
    nodejs
    yarn
    _1password
    nodePackages.cdktf-cli
    nodePackages.cdk8s-cli
    terraform
    kubectl
    azure-cli
  ];

  shellHook = ''
    echo "Entering Azure Setup Environment"
    export NODE_OPTIONS="--max-old-space-size=4096"
    export ENV=${ENV:-dev}
  '';
}
