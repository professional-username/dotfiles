{ config, pkgs, lib, ... }: {
  imports = [ ];

  fonts.packages = with pkgs; [
    # Install system-wide fonts
    fira-code
    fira-code-symbols
    nerd-fonts.fira-code
  ];

}
