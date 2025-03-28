{ config, lib, pkgs, ... }:

{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    # enableNushellIntegration = true; # Uncomment if needed
    enableZshIntegration = true;
    defaultOptions = [
      "--height 40%"
      "--border"
    ];
  };
}
