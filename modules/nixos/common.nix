# Common to Linux & darwin
{
  flake,
  pkgs,
  ...
}: let
  inherit (flake) config inputs;
in {
  home-manager = {
    backupFileExtension = "backup";
    useUserPackages = true;
    useGlobalPkgs = true;
  };
  nixpkgs.config.allowUnfree = true;
  nix = {
    nixPath = ["nixpkgs=${inputs.nixpkgs}"]; # Enables use of `nix-shell -p ...` etc
    registry.nixpkgs.flake = inputs.nixpkgs; # Make `nix shell` etc use pinned nixpkgs
    settings = {
      max-jobs = "auto";
      experimental-features = "nix-command flakes";
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
