{ inputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [ ];

  programs.vscode = { enable = true; };
}
