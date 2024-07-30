{ config, pkgs, ... }:

let
  setWallpaperScript = pkgs.writeShellScriptBin "set-wallpaper" ''
    echo "Setting wallpaper"
    WALLPAPERS_DIR="$HOME/Pictures/wallpapers"
    DEFAULT_WALLPAPER="$HOME/.config/nixos-config/images/wallpaper_default.png"

    if [ -d "$WALLPAPERS_DIR" ] && [ "$(ls -A $WALLPAPERS_DIR)" ]; then
      WALLPAPER=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)
      echo "Setting random wallpaper ($WALLPAPER)"
    else
      WALLPAPER="$DEFAULT_WALLPAPER"
      echo "Setting default wallpaper"
    fi

    ${pkgs.swww}/bin/swww img "$WALLPAPER"
    echo "Set wallpaper $WALLPAPER"
  '';
in {
  home.packages = [ pkgs.swww setWallpaperScript ];

  # systemd.user.services.swww = {
  #   Unit = {
  #     Description = "Wayland wallpaper daemon";
  #     PartOf = [ "graphical-session.target" ];
  #   };
  #   Service = {
  #     ExecStart = "${pkgs.swww}/bin/swww-daemon";
  #     ExecStopPost = "${pkgs.swww}/bin/swww kill";
  #   };
  #   Install = { WantedBy = [ ]; };
  # };

  systemd.user.services.set-wallpaper = {
    Unit = {
      Description = "Set random wallpaper";
      After = [ "swww.service" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${setWallpaperScript}/bin/set-wallpaper";
    };
    Install = { WantedBy = [ ]; };
  };
}
