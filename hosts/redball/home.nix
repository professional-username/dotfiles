{ ... }:

{
  wayland.windowManager.hyprland.settings.monitor = [
    "eDP-1,preferred,0x0,1"
  ];

  gtk.gtk3.extraConfig.gtk-xft-dpi = 98304;
  gtk.gtk4.extraConfig.gtk-xft-dpi = 98304;

  home.sessionVariables = {
    QT_WAYLAND_FORCE_DPI = "96";
    XCURSOR_SIZE = "24";
  };
}
