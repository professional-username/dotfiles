{ config, pkgs, ... }: {
  imports = [ ./locale.nix ./networking.nix ./users.nix ];
}
