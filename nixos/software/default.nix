{ config, pkgs, ... }: {
  imports =
    [ ./display.nix ./audio.nix ./programs.nix ./bootloader.nix ./colours.nix ];
}
