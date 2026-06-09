# Replace this file on redball with the output from:
#   sudo nixos-generate-config --show-hardware-config
{ lib, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = lib.mkDefault [ ];
  boot.initrd.kernelModules = lib.mkDefault [ ];
  boot.kernelModules = lib.mkDefault [ ];
  boot.extraModulePackages = lib.mkDefault [ ];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
