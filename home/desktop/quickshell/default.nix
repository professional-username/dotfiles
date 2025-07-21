{ inputs, pkgs, ... }: {
  imports = [
    # ./ags # Replace with quickshell
  ];

  home.packages = [ inputs.quickshell.packages.${pkgs.system}.default ];
}
