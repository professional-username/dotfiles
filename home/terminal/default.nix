{ inputs, lib, config, pkgs, ... }: {
  # programs.foot.enable = lib.mkForce false;
  programs.foot.settings.colors.alpha = lib.mkForce 1;
  programs.foot.settings.main.font = lib.mkForce "Fira Code:size=12";

  imports = [
    # various config files
    ./kitty.nix
    ./fish.nix
    ./rbw.nix
    ./starship.nix
    ./jrnl.nix
  ];
}
