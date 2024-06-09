{ inputs, lib, config, pkgs, ... }: {
  imports = [ ];

  programs.kitty = {
    enable = true;

    # Environment vars
    environment = { };

    # Font
    # font = { };
  };
}
