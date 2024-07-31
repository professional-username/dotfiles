{ config, pkgs, lib, defaultWallpaper, ... }:

{
  # Set the sddm theme
  services.displayManager.sddm = {
    enable = true; # Enable SDDM.
    wayland.enable = true;
    enableHidpi = true;
    sugarCandyNix = {
      enable = true;
      settings = {
        # General settings
        Background = lib.cleanSource defaultWallpaper;
        ScreenWidth = 3840;
        ScreenHeight = 2160;
        Font = "FiraCode Nerd Font";
        # Form settings
        HeaderText = "Welcome!";
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
