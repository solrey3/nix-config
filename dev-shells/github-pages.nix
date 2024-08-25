{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    ruby
    bundler
    jekyll
  ];

  shellHook = ''
    bundle install
  '';
}
