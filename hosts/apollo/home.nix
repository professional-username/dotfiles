{ ... }:

{
  wayland.windowManager.hyprland.settings.monitor = [
    "HDMI-A-3,2560x1330@60,0x0,1"
    "HDMI-A-2,2560x1330@60,2560x0,1"
  ];

  gtk.gtk3.extraConfig.gtk-xft-dpi = 230400;
  gtk.gtk4.extraConfig.gtk-xft-dpi = 230400;

  home.sessionVariables = {
    QT_WAYLAND_FORCE_DPI = "108";
    XCURSOR_SIZE = "32";
  };
}
