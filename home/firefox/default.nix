{ inputs, lib, config, pkgs, ... }: {
  imports = [ ./policies.nix ./profiles.nix ];

  # Setup basic settings
  programs.firefox = { enable = true; };
}
