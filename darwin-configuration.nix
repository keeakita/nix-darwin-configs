{ config, pkgs, ... }:

{
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

    # Languages
    rustup

    # CLI
    neovim
    chezmoi

    # For music management
    flac

    # Desktop applications
    alacritty   # Terminal
  ];

  environment.shells = with pkgs; [
    zsh
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
