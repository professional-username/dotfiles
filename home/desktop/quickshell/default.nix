{ inputs, pkgs, ... }: {
  imports = [
    # ./ags # Replace with quickshell
  ];

  home.packages = [ inputs.quickshell.packages.${pkgs.system}.default ];

  home.file.".config/quickshell/" = {
    source = ./config;
    recursive = false;
    force = true;
  };

  stylix.targets.qt.enable = true;
}
