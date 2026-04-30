{ config, pkgs, ... }:

let
  setWallpaperScript = pkgs.writeShellScriptBin "set-wallpaper" ''
    WALLPAPERS_DIR="$HOME/Pictures/wallpapers"
    DEFAULT_WALLPAPER="$HOME/.config/nixos-config/images/wallpaper_default.png"

    if [ -d "$WALLPAPERS_DIR" ] && [ "$(ls -A $WALLPAPERS_DIR)" ]; then
      WALLPAPER=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)
      echo "Setting random wallpaper ($WALLPAPER)"
    else
      WALLPAPER="$DEFAULT_WALLPAPER"
      echo "Setting default wallpaper"
    fi

    ${pkgs.awww}/bin/awww restore
    ${pkgs.awww}/bin/awww img "$WALLPAPER" -t center
  '';
in {
  home.packages = [ pkgs.awww setWallpaperScript ];

  systemd.user.services.awww = {
    Unit = {
      Description = "Wayland wallpaper daemon";
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.awww}/bin/awww-daemon";
      ExecStopPost = "${pkgs.awww}/bin/awww kill";
    };
    Install = { WantedBy = [ ]; };
  };

  systemd.user.services.set-wallpaper = {
    Unit = {
      Description = "Set random wallpaper";
      After = [ "awww.service" ];
      Requires = [ "awww.service" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${setWallpaperScript}/bin/set-wallpaper";
    };
    Install = { WantedBy = [ ]; };
  };
}
