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
  name = "typescript-devops";
  packages = with pkgsWithConfig; [
    nodejs
    yarn
    nodePackages.cdktf-cli
    nodePackages.cdk8s-cli
    terraform
    docker
    docker-compose
    kubectl
    nmap
  ];

  shellHook = ''
    echo "Entering TypeScript DevOps Environment"
  '';
}
