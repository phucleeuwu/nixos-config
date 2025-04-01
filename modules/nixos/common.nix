# Common to Linux & darwin
{
  flake,
  pkgs,
  lib,
  ...
}: let
  inherit (flake) config inputs;
  inherit (inputs) self;
in {
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = lib.attrValues self.overlays;
  };
  home-manager = {
    backupFileExtension = "backup";
  };
  nix = {
    nixPath = ["nixpkgs=${inputs.nixpkgs}"]; # Enables use of `nix-shell -p ...` etc
    registry.nixpkgs.flake = inputs.nixpkgs; # Make `nix shell` etc use pinned nixpkgs
    settings = {
      max-jobs = "auto";
      # Nullify the registry for purity.
      flake-registry = builtins.toFile "empty-flake-registry.json" ''{"flakes":[],"version":2}'';
      trusted-users = [
        "root"
        (
          if pkgs.stdenv.isDarwin
          then config.me.username
          else "@wheel"
        )
      ];
    };
  };
}
