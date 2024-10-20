{ config, pkgs, ... }: {
  imports = [
    ./display
    ./audio.nix
    ./programs.nix
    ./bootloader
    ./stylix.nix
    ./settings.nix
    ./fonts.nix
  ];
}
