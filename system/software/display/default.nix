{ config, pkgs, ... }:

{
  imports = [ ];

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.enable = true;
  # services.xserver.desktopManager.plasma6.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.wayland.enable = true;

  # Set the sddm theme
  services.displayManager.sddm.theme = toString ./sugar-dark;

  # services.xserver.displayManager.sessionPackages =
  #   [ pkgs.libsForQt5.plasma5.plasma-workspace ];

  # Enable hyprland
  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # Whether to enable XWayland
    xwayland.enable = true;
  };

  # Enable animated wallpapers
  environment.systemPackages = with pkgs; [ swww ];

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

}