{ inputs, pkgs, config, ... }:
{
  imports = [
    ./colors.nix # Colours set in a seperate file
    inputs.caelestia-nix.homeManagerModules.default
  ];

  home.packages = with pkgs; [ gpu-screen-recorder kdePackages.dolphin ];

  # Configuration file for swappy
  home.file."swappy-config" = {
    target = ".config/swappy/config";
    text = ''
        [Default]
        save_dir=$HOME/Pictures/Screenshots
        early_exit=true
        auto_save=true
    '';
  };

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
