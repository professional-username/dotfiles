{ config, pkgs, lib, defaultWallpaper, ... }:

{
  # Use sddm for login management
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.enableHidpi = true;
  # services.xserver.desktopManager.plasma6.enable = true;

  # Set the sddm theme
  services.displayManager.sddm = {
    # enable = true; # Enable SDDM.
    sugarCandyNix = {
      enable = true;
      settings = {
        # General settings
        Background = lib.cleanSource defaultWallpaper;
        ScreenWidth = 3840;
        ScreenHeight = 2160;
        Font = "Fira Code Bold";
        # Form settings
        FormPosition = "left";
        HaveFormBackground = true;
        PartialBlur = true;
        # Customize colors
        BackgroundColor = "#0c0b11";
        MainColor = "#908caa";
        AccentColor = "#9ccfd8";
      };
    };
  };

}
