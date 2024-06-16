{ config, pkgs, ... }:

{
  # Colours
  stylix.image =
    /home/username/Pictures/wallpapers/wallpaper-nimona-villain.jpg;
  stylix.polarity = "dark";

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";

  stylix.targets.grub.enable = false;
}