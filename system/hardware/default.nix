{ config, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ./nvidia.nix ];
}
