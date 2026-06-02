{ config, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ./nvidia.nix ];

  hardware.bluetooth.enable = true;
  hardware.graphics.enable = true;
  services.blueman.enable = true;
}
