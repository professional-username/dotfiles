{ config, pkgs, ... }: {
  imports = [
    ./core.nix
    ./packages.nix
    ./keybindings.nix
    ./ui.nix
    ./development.nix
    ./tools.nix
  ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };
}
