{ inputs, config, pkgs, lib, defaultWallpaper, ... }:

let
  sddm-theme = inputs.silentSDDM.packages.${pkgs.system}.default.override {
    theme = "catppuccin-mocha";
  };
in {
  environment.systemPackages = [ sddm-theme ];
  qt.enable = true;
  # Set the sddm theme
  services.displayManager.sddm = {
    package = pkgs.kdePackages.sddm; # use qt6 version of sddm
    enable = true; # Enable SDDM.
    wayland.enable = true;
    enableHidpi = true;
    extraPackages = sddm-theme.propagatedBuildInputs;
    theme = sddm-theme.pname;
    settings = {
      # required for styling the virtual keyboard
      General = {
        GreeterEnvironment =
          "QML2_IMPORT_PATH=${sddm-theme}/share/sddm/themes/${sddm-theme.pname}/components/,QT_IM_MODULE=qtvirtualkeyboard";
        InputMethod = "qtvirtualkeyboard";
      };
    };
    # sugarCandyNix = {
    #   enable = true;
    #   settings = {
    #     # General settings
    #     Background = lib.cleanSource defaultWallpaper;
    #     ScreenWidth = 3840;
    #     ScreenHeight = 2160;
    #     Font = "FiraCode Nerd Font";
    #     # Form settings
    #     HeaderText = "Welcome!";
    #     FormPosition = "left";
    #     HaveFormBackground = true;
    #     PartialBlur = true;
    #     # Customize colors
    #     BackgroundColor = "#0c0b11";
    #     MainColor = "#908caa";
    #     AccentColor = "#9ccfd8";
    #   };
    # };
  };

}
