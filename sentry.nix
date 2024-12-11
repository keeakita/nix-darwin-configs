{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs_22  # For getsentry/craft
    uv         # For getsentry/opsbot
    jsonnet    # For getsentry/ops
  ];
}
