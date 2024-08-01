{ inputs, ... }: {
  imports = [
    # Manage Desktop-related configurations
    ./hyprland.nix
    ./swww.nix
    ./ags
  ];
}
