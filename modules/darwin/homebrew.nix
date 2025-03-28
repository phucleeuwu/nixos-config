{ flake, ... }:
{
  nix-homebrew = {
    enable = true;
    user = "${flake.config.me.username}";
    autoMigrate = true;
  };
  homebrew = {
    enable = true;
    casks = [
      "karabiner-elements"
      "ghostty"
    ];
    onActivation.cleanup = "zap"; # Declarative nature of homebrew
  };
}
