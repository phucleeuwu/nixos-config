# Common to Linux & darwin
{
  flake,
  pkgs,
  lib,
  ...
}: let
  inherit (flake) inputs;
in {
  home-manager = {
    backupFileExtension = "backup";
    useUserPackages = true;
    useGlobalPkgs = true;
  };
  nixpkgs.config.allowUnfree = true;
  nix = {
    nixPath = ["nixpkgs=${flake.inputs.nixpkgs}"]; # Enables use of `nix-shell -p ...` etc
    registry.nixpkgs.flake = flake.inputs.nixpkgs; # Make `nix shell` etc use pinned nixpkgs
    settings = {
      max-jobs = "auto";
      experimental-features = "nix-command flakes";
      # I don't have an Intel mac.
      extra-platforms = lib.mkIf pkgs.stdenv.isDarwin "aarch64-darwin x86_64-darwin";
      # Nullify the registry for purity.
      flake-registry = builtins.toFile "empty-flake-registry.json" ''{"flakes":[],"version":2}'';
      trusted-users = [
        "root"
        (
          if pkgs.stdenv.isDarwin
          then flake.config.me.username
          else "@wheel"
        )
      ];
    };
  };
}
