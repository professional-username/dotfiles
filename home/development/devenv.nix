{ inputs, lib, config, pkgs, ... }: {
  imports = [ ];

  home.packages = with pkgs; [ devenv ];
  # Enable direnv for project switching
  programs.direnv = { enable = true; };
}
