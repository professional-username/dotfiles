{ config, pkgs, ... }: {
  imports = [ ./display ./audio.nix ./programs.nix ./bootloader ./colours.nix ];
}
