{ config, pkgs, defaultWallpaper, ... }:

{
  # Colours
  stylix.enable = true;
  stylix.image = defaultWallpaper;
  stylix.polarity = "dark";

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";

  stylix.targets.grub.enable = false;
}
