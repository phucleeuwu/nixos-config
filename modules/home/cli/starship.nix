_: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    enableTransience = true;
    settings = {
      command_timeout = 1000;
      character = {
        success_symbol = "[[󰄛](green) ❯](peach)";
        error_symbol = "[[󰄛](red) ❯](peach)";
        vimcmd_symbol = "[󰄛 ❮](subtext1)";
      };
      git_branch = {
        style = "bold mauve";
      };
      directory = {
        truncation_length = 4;
        style = "bold lavender";
        read_only = "󰌾";
        home_symbol = "";
      };
      git_metrics = {
        disabled = false;
      };
      cmd_duration = {
        min_time = 10000;
      };
    };
  };
}
