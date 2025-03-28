# Configuration for my M1 Macbook Max as headless server
{ flake, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  nixos-unified.sshTarget = "srid@infinitude";

  imports = [
    self.darwinModules.default
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
