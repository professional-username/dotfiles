{ inputs, lib, config, pkgs, ... }: {
  imports = [ ];

  x.targets.hyprland.enable = false;

  # Extra "inventory space"
  home.sessionVariables = { HYPRLAND_INVENTORY = 1; };

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      monitor = [ "DP-1,3840x2160@120,0x0,1" ];
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
      "$GUI_EDITOR" = "emacs";
      exec-once = [
        "ags"
        "systemctl --user start swww"
        "systemctl --user start set-wallpaper"
      ];
      # Mouse Binds
      bindm = [
        # Window
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      # Keybinds
      binde = [
        # Utility
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
        # Window rules
        "$mod CONTROL, h, resizeactive, -50 0"
        "$mod CONTROL, j, resizeactive, 0 50"
        "$mod CONTROL, k, resizeactive, 0 -50"
        "$mod CONTROL, l, resizeactive, 50 0"
      ];
      bindr = [
        # "Windows key"
        "$mod, O, exec, tofi-drun --drun-launch=true"
      ];
      bind = [
        # Program rules
        "$mod, N, exec, firefox"
        "$mod, RETURN, exec, kitty"
        "$mod SHIFT, E, exec, $GUI_EDITOR"
        "$mod SHIFT, Z, exec, zotero"
        "$mod SHIFT, T, exec, steam"
        "$mod SHIFT, B, exec, blender"
        # Utility
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        "$mod SHIFT, S, exec, hyprshot -m region -o ~/Pictures/Screenshots/"
        "$mod CONTROL, S, exec, hyprshot -m window -o ~/Pictures/Screenshots/"
        ", Print, exec, hyprshot -m output -o ~/Pictures/Screenshots/"
        # Window Rules
        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"
        "$mod SHIFT, h, movewindow, l"
        "$mod SHIFT, j, movewindow, d"
        "$mod SHIFT, k, movewindow, u"
        "$mod SHIFT, l, movewindow, r"

        "$mod, c, centerwindow, 1"

        "$mod, w, killactive"
        "$mod, f, fullscreen, 0"
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
