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
    terraform
    nodePackages.cdktf-cli
    nodePackages.cdk8s-cli
  ];

  shellHook = ''
    echo "Entering TypeScript DevOps Environment"
  '';
}
