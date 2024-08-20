{ inputs, lib, config, pkgs, ... }: {
  imports = [ ];

  # Some essential environment variables
  home.sessionVariables = { EDITOR = "nvim"; };

  programs.fish = {
    enable = true;

  };
}
