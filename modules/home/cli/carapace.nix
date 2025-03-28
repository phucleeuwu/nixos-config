{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.carapace = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
  };
}
