{ inputs, lib, config, pkgs, ... }: {
  imports = [
    # various config files
    ./kitty.nix
    ./fish.nix
    ./rbw.nix
    ./starship.nix
    ./jrnl.nix
  ];
}
