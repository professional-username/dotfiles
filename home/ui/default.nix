{ inputs, lib, config, pkgs, ... }:
let gtk_config = { gtk-xft-dpi = 230400; };
in {
  # GTK extra config
  gtk.gtk3.extraConfig = gtk_config;
  gtk.gtk4.extraConfig = gtk_config;

  # Scaling environment variables
  home.sessionVariables = {
    GDK_SCALE = "1";
    GDK_DPI_SCALE = "0.5";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_FORCE_DPI = "225";
    CLUTTER_SCALE = "1";
    ECORE_EVAS_ENGINE = "wayland_egl";
    XCURSOR_SIZE = "32";
  };
}
