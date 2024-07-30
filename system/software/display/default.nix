{ config, pkgs, ... }:

{
  imports = [ ./sddm.nix ];

  environment.systemPackages = with pkgs;
    [
      swww # Enable animated wallpapers
    ];

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
