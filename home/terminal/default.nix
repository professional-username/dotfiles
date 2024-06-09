{ inputs, lib, config, pkgs, ... }: {
  imports = [
    # Emulator
    ./kitty.nix
    # Shell
    ./fish.nix
  ];
}
