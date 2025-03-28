# Configuration common to all macOS systems
{flake, ...}: let
  inherit (flake) config inputs;
  inherit (inputs) self;
in {
  imports = [
    {
      users.users.${flake.config.me.username} = {
        home = "/Users/${flake.config.me.username}";
      };
      home-manager.users.${config.me.username} = {};
      home-manager.sharedModules = [
        self.homeModules.default
        self.homeModules.darwin-only
        inputs.catppuccin.homeManagerModules.catppuccin
        inputs.lazyvim.homeManagerModules.lazyvim
      ];
    }
    inputs.nix-homebrew.darwinModules.nix-homebrew
    self.nixosModules.common
    self.darwinModules.system
    self.darwinModules.homebrew
  ];
}
