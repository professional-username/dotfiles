{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system/hardware/nvidia.nix
  ];

  networking.hostName = "apollo";
}
