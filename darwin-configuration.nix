{ config, pkgs, ... }:

{
  imports = [
    ./sentry.nix
  ];

  system.primaryUser = "keea";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    ## Core Utilities
    coreutils
    util-linux  # for rename
    findutils
    openssh
    git
    curl
    wget
    parallel
    unzip
    silver-searcher
    gnused
    unixtools.watch
    gnumake
    gh  # GitHub CLI
    jq
    tmux

    # Languages
    rustup

    # CLI
    neovim
    chezmoi
    ranger

    # For music management
    flac

    # Desktop applications
    alacritty   # Terminal
  ];

  # Fonts
  fonts.packages = with pkgs; [
    fira-code
  ];

  environment.shells = with pkgs; [
    zsh
  ];

  # Auto upgrade nix package and the daemon service.
  nix.enable = true;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina

  nix.gc.automatic = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
