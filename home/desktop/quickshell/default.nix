{ inputs, pkgs, ... }:
{
  imports = [
    # ./ags # Replace with quickshell
    inputs.caelestia-nix.homeManagerModules.default
  ];

  home.packages = [
    inputs.quickshell.packages.${pkgs.system}.default
  ];

  programs.caelestia.enable = true;

  # home.file.".config/quickshell/" = {
  #   source = ./config;
  #   recursive = false;
  #   force = true;
  # };

  stylix.targets.qt.enable = true;
}
