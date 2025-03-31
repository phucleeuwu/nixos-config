# Configuration common to all Linux systems
{flake, ...}: let
  inherit (flake) config inputs;
  inherit (inputs) self;
in {
  imports = [
    {
      users.users.${config.me.username}.isNormalUser = true;
      home-manager.users.${config.me.username} = {};
      home-manager.sharedModules = [
        self.homeModules.default
        self.homeModules.linux-only
        inputs.catppuccin.homeModules.catppuccin
        inputs.lazyvim.homeManagerModules.lazyvim
      ];
    }
    self.nixosModules.common
  ];
}
