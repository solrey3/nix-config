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
  name = "python-data-science";
  packages = with pkgsWithConfig; [
    python3
    python3Packages.numpy
    python3Packages.pandas
    python3Packages.matplotlib
    python3Packages.scipy
    python3Packages.beautifulsoup4
    python3Packages.lxml
    python3Packages.selenium
    python3Packages.requests
    jupyter
  ];

  shellHook = ''
    echo "Entering Python Data Science and Web Scraping Environment"
  '';
}
