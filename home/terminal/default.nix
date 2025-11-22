{ inputs, lib, config, pkgs, ... }: {
  programs.foot.enable = lib.mkForce false;

  imports = [
    # various config files
    ./kitty.nix
    ./fish.nix
    ./rbw.nix
    ./starship.nix
    ./jrnl.nix
  ];
}
