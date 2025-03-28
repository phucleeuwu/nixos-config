# Configuration for my M1 Macbook Max as headless server
{flake, pkgs, config, ...}: let
  inherit (flake) inputs;
  inherit (inputs) self;
in {
  imports = [
    self.darwinModules.default
  ];
  nix.enable = false;
  nixos-unified.sshTarget = "srid@infinitude";
  nixpkgs.hostPlatform = "aarch64-darwin";
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
  security.pam.services.sudo_local.touchIdAuth = true;

  homebrew = {
    enable = true;
    casks = [
      "karabiner-elements"
      "ghostty"
    ];
    onActivation.cleanup = "zap"; # Declarative nature of homebrew
  };
}
