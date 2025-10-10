{ inputs, pkgs, config, ... }:
{
  imports = [
    ./colors.nix # Colours set in a seperate file
    inputs.caelestia-nix.homeManagerModules.default
  ];

  programs.caelestia-dots = {
    enable = true;
    hypr.enable = false;

    # Extra caelestia settings
    caelestia.shell.settings = {
      background.enabled = false;
      bar.status = {
        showBattery = false;
      };
    };
  };

  stylix.targets.qt.enable = true;
}
