{ inputs, lib, config, pkgs, ... }: {
  imports = [ ];

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
}
