{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    ## Core Utilities
    coreutils
    openssh
    git
    curl
    wget

    # CLI
    neovim
    chezmoi

    # Desktop applications
    alacritty   # Terminal
    supersonic  # Navidrome-compatible music player
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
