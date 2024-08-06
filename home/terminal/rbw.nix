{ inputs, lib, config, pkgs, ... }: {
  imports = [ ];

  home.packages = with pkgs; [ pinentry-tty ];

  programs.rbw = { enable = true; };
}
