{ config, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ./nvidia.nix ];

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
