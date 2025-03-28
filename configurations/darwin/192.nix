# Configuration for my M1 Macbook Max as headless server
{flake, ...}: let
  inherit (flake) inputs;
  inherit (inputs) self;
in {
  imports = [
    self.darwinModules.default
    ./system.nix
  ];
  nixpkgs.hostPlatform = "aarch64-darwin";
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
  security.pam.services.sudo_local.touchIdAuth = true;

  programs.fish.enable = true; # macOs default shell
  environment.shells = [pkgs.fish];

  homebrew = {
    enable = true;
    casks = [
      "karabiner-elements"
      "ghostty"
    ];
    onActivation.cleanup = "zap"; # Declarative nature of homebrew
  };
}
