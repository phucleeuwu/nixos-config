{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    extraConfig = {
      init.defaultBranch = "main";

      delta = {
        enable = true;
        side-by-side = false;
        true-color = "always";
        hyperlinks = true;
        line-numbers = true;
      };

      credential.helper = "osxkeychain"; # macOS Keychain for credentials
    };
  };
}
