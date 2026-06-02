{ inputs, pkgs, config, ... }:
{
  imports = [
    ./colors.nix # Colours set in a seperate file
    inputs.caelestia-nix.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    gpu-screen-recorder
    kdePackages.dolphin
    swappy
    quickshell
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
  # xdg.portal = {
  #   enable = true;
  #   extraPortals = [
  #       pkgs.xdg-desktop-portal-hyprland
  #       pkgs.xdg-desktop-portal-gtk
  #   ];
  # };


  programs.caelestia-dots = {
    enable = true;
    hypr.enable = false;

    editor.vscode.enable = false;

    # Extra caelestia settings
    caelestia.shell.settings = {
      background.enabled = false;
      # bar.status = {
      #   showbattery = false;
      # };
      bar.status.showBattery = false;

      # Prevent popout showing the active window on the left
      bar.popouts.activeWindow = false; 

      general.apps.explorer = ["dolphin"];
      notifs.actionOnClick = true;
    };
  };

  stylix.targets.qt.enable = true;
}
