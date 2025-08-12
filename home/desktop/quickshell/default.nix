{ inputs, pkgs, ... }:
# let
#   caelestia-shell = inputs.caelestia-shell.packages."x86_64-linux".default.override {
#     withCli = true;
#   };
# in
{
  imports = [
    # ./ags # Replace with quickshell
  ];

  home.packages = [
    inputs.quickshell.packages.${pkgs.system}.default
    # caelestia-shell
  ];

  home.file.".config/quickshell/" = {
    source = ./config;
    recursive = false;
    force = true;
  };

  stylix.targets.qt.enable = true;
}
