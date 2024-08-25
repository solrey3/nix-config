{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    python3
    python3Packages.numpy
    python3Packages.pandas
    python3Packages.matplotlib
    python3Packages.scipy
    python3Packages.beautifulsoup4
    python3Packages.lxml
    python3Packages.selenium
    python3Packages.requests
  ];
}
