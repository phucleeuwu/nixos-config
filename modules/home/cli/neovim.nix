_: {
  programs.lazyvim = {
    enable = true;
    extras = {
      lang = {
        nix.enable = true;
      };
    };
  };
}
