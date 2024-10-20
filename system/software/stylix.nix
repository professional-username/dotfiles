{ config, pkgs, defaultWallpaper, ... }:

{
  stylix = {
    # Colours
    enable = true;
    image = defaultWallpaper;
    polarity = "dark";

    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";

    targets.grub.enable = false;

    # Fonts
    fonts = {
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = config.stylix.fonts.monospace;
      monospace = {
        package = pkgs.fira-code;
        name = "Fira Code";
      };
    };
  };
}
