{ inputs, lib, config, pkgs, ... }: {
  imports = [ ];

  stylix.targets.hyprland.enable = false;

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      monitor = [ "DP-1,3840x2160@120,0x0,2" ];
      general = {
        # Borders etc
        border_size = 5;
        gaps_in = 25;
        gaps_out = "50,50,50,50";
      };
      # Decoration
      decoration = {
        rounding = 10;
        inactive_opacity = 0.9;
        blur.size = 20;
      };

      input = {
        kb_options = "caps:escape";
        touchpad.natural_scroll = true;
      };
      "$mod" = "SUPER";
      "$GUI_EDITOR" = "code";
      exec-once = [
        "systemctl --user start swww"
        "systemctl --user start set-wallpaper"
      ];
      # Mouse Binds
      bindm = [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];
      # Keybinds
      bind = [
        # Program rules
        "$mod, N, exec, firefox"
        "$mod, RETURN, exec, kitty"
        "$mod SHIFT, E, exec, $GUI_EDITOR"
        # Window Rules
        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"
        "$mod SHIFT, h, movewindow, l"
        "$mod SHIFT, j, movewindow, d"
        "$mod SHIFT, k, movewindow, u"
        "$mod SHIFT, l, movewindow, r"

        "$mod CONTROL, h, resizeactive, -50 0"
        "$mod CONTROL, j, resizeactive, 0 50"
        "$mod CONTROL, k, resizeactive, 0 -50"
        "$mod CONTROL, l, resizeactive, 50 0"
        "$mod, c, centerwindow, 1"

        "$mod, w, killactive"
        "$mod, f, fullscreen, 0"
        "$mod SHIFT, f, fakefullscreen"
        "$mod, m, fullscreen, 1"
        "$mod, tab, cyclenext"
        "$mod SHIFT, tab, cyclenext, prev"
        "$mod, s, togglefloating"
        # Workspace rules
        "$mod, bracketright, workspace, +1"
        "$mod, bracketleft, workspace, -1"
        "$mod, SPACE, togglespecialworkspace"
        "$mod SHIFT, SPACE, movetoworkspace, special"
      ] ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (x:
          let
            ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
          in [
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
            "$mod SHIFT, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
          ]) 10));
      # Miscallaneous settings
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        background_color = "0x26233a";
      };
    };
  };
}
