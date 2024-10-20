{ inputs, pkgs, ... }: {
  imports = [
    # Manage Desktop-related configurations
    ./hyprland.nix
    ./swww.nix
    ./ags
  ];

  # Notification daemon
  services.dunst = {
    enable = true;
    settings.global = {
      offset = "30x30";
      corner_radius = "12";
      padding = "12";
      horizontal_padding = "12";
    };
  };
}
