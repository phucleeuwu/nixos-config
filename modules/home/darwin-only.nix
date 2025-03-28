{pkgs, ...}: {
  imports = [
    ./gui/aerospace.nix
  ];

  home.packages = with pkgs; [
    arc-browser
  ];
}
