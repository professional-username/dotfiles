{ inputs, pkgs, config, ... }:
{
  imports = [
    ./colors.nix # Colours set in a seperate file
    inputs.caelestia-nix.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    gpu-screen-recorder
    kdePackages.dolphin
    # caelestia-cli
  ];

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
  
  # xdg = {
  #   mimeApps = {
  #     enable = true;
  #     defaultApplications = {
  #       "inode/directory" = "org.kde.dolphin.desktop";
  #     };
  #     # addedAssociations = {
  #     #   "inode/directory" = [ "org.kde.dolphin.desktop" ];
  #     # };
  #   };
  # };


  programs.caelestia-dots = {
    enable = true;
    hypr.enable = false;

    # Extra caelestia settings
    caelestia.shell.settings = {
      background.enabled = false;
      bar.status = {
        showBattery = false;
      };
      general.apps.explorer = ["dolphin"]; # TODO: Doesn't work / open video file from widget
      notifs.actionOnClick = true; #
    };
  };

  stylix.targets.qt.enable = true;
}
