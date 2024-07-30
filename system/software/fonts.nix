{ config, pkgs, ... }: {
  imports = [ ];

  fonts.packages = with pkgs; [
    # Install system-wide fonts
    fira-code
    fira-code-symbols
    nerdfonts
  ];
}
