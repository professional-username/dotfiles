{ inputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [ ];

  # Enable direnv for project switching
  programs.direnv = { enable = true; };
}
