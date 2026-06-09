{ inputs, lib, config, pkgs, ... }:
{
  # GTK extra config
  gtk.iconTheme.name =  "Adwaita";

  stylix.targets.btop.enable=false;

  # Scaling environment variables
  home.sessionVariables = {
    GDK_SCALE = "1";
    GDK_DPI_SCALE = "1";
    QT_QPA_PLATFORM = "wayland";
    CLUTTER_SCALE = "1";
    ECORE_EVAS_ENGINE = "wayland_egl";
  };
}
