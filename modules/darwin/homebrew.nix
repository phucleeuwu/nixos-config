_: {
  homebrew = {
    enable = true;
    casks = [
      "karabiner-elements"
      "ghostty"
    ];
    onActivation.cleanup = "zap"; # Declarative nature of homebrew
  };
  nix-homebrew = {
    # Install Homebrew under the default prefix
    enable = true;

    # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2

    # User owning the Homebrew prefix
    user = "phuc";

    # Automatically migrate existing Homebrew installations
    autoMigrate = true;
  };
}
