{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    nodejs
    yarn
    terraform
    cdktf
    cdk8s
  ];
}
