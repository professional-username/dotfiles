{ inputs, lib, config, pkgs, ... }: {
  imports = [
    # Various config files
    ./kitty.nix
    ./fish.nix
    ./git.nix
  ];
}
