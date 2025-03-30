{...}:
{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    # enableFishIntegration = true;
    # enableNushellIntegration = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = {}
      config.font = wezterm.font 'Maple Mono NF'
      config.font_size = 19
      config.enable_tab_bar = false
      config.window_decorations = "RESIZE"
      config.color_scheme = "Catppuccin Mocha"
      config.window_close_confirmation = 'NeverPrompt'
      return config
    '';
  };
}
