{ config, pkgs, ... }: {
  imports = [
    ./display.nix
    ./audio.nix
    ./programs.nix
    ./bootloader/bootloader.nix
    ./colours.nix
  ];
}
