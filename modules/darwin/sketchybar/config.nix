{ pkgs, ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      sbarlua = prev.callPackage ./sbarlua.nix {};
    })
  ];

  homebrew = {
    casks = [
      "sf-symbols"
      "font-sf-mono"
      "font-sf-pro"
    ];
  };

  services.sketchybar = {
    enable = true;
    extraPackages = [
      pkgs.sketchybar-app-font
    ];
  };
}
