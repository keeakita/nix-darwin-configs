{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs_22  # For getsentry/craft
    rye        # For getsentry/opsbot
  ];
}
