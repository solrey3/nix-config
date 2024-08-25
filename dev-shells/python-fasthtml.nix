{ pkgs, ... }:

pkgs.mkShell {
  packages = with pkgs; [
    python3
    python3Packages.pip
  ];

  shellHook = ''
    pip install python-fasthtml
  '';
}
