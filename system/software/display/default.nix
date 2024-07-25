{ config, pkgs, ... }:

{
  imports = [ ];

  environment.systemPackages = with pkgs;
    [
      # (callPackage ./sddm-rose-pine.nix { }) # Install the rose-pine sddm theme
      swww # Enable animated wallpapers
    ];

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.enable = true;
  # services.xserver.desktopManager.plasma6.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.wayland.enable = true;
  # services.xserver.displayManager.sddm.theme = "rose-pine";
  services.xserver.displayManager.sddm.settings = {
    X11 = {
      ServerArguments = "-dpi 192"; # Adjust this value as needed
    };
  };

  # Set the sddm theme
  # services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.enableHidpi = true;
  services.displayManager.sddm = {
    # enable = true; # Enable SDDM.
    sugarCandyNix = {
      enable = true; # This set SDDM's theme to "sddm-sugar-candy-nix".
      settings = {
        # Set your configuration options here.
        # Here is a simple example:
        # Background = lib.cleanSource ./background.png;
        ScreenWidth = 3840;
        ScreenHeight = 2160;
        FormPosition = "left";
        HaveFormBackground = true;
        PartialBlur = true;
        # ...
      };
    };
  };

  # services.displayManager.sddm.theme = "rose-pine";
  # services.displayManager.sddm.extraPackages =
  #   [ pkgs.libsForQt5.qt5.qtgraphicaleffects ];

  # services.xserver.displayManager.sessionPackages =
  #   [ pkgs.libsForQt5.plasma5.plasma-workspace ];

  # Enable hyprland
  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # Whether to enable XWayland
    xwayland.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

}
