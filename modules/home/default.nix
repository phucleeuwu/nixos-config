{
  home.stateVersion = "22.11";
  imports = [
    ./aliases.nix
    ./shell/fish.nix
    # ./shell/nushell.nix
    # ./shell/zsh.nix

    ./cli/atuin.nix
    ./cli/bat.nix
    ./cli/carapace.nix
    ./cli/eza.nix
    ./cli/fastfetch.nix
    ./cli/fd.nix
    ./cli/fzf.nix
    # ./cli/gh-dash.nix
    ./cli/git.nix
    # ./cli/helix.nix
    ./cli/lazygit.nix
    # ./cli/nh.nix
    # ./cli/oh-my-posh.nix
    ./cli/ripgrep.nix
    ./cli/starship.nix
    # ./cli/tmux.nix
    ./cli/yazi.nix
    # ./cli/zellij.nix
    ./cli/zoxide.nix

    # ./gui/ghostty.nix
    # ./gui/zed-editor.nix
  ];
}
