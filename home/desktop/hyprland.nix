{ inputs, lib, config, pkgs, ... }: {
  imports = [ ];

  stylix.targets.hyprland.enable = true;

  # Install hyprcursor
  home.packages = with pkgs; [rose-pine-hyprcursor];

  # Extra "inventory space"
  home.sessionVariables = { HYPRLAND_INVENTORY = 1; };

  wayland.windowManager.hyprland = {
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    plugins = [
      inputs.split-monitor-workspaces.packages.${pkgs.stdenv.hostPlatform.system}.split-monitor-workspaces
      # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprbars
    ];
    enable = true;

    settings = {

      _1submap = {
        exec = ["hyprctl dispatch submap global"];
        submap = "global";
      };

      env = [
        "HYPRCURSOR_THEME,rose-pine-hyprcursor"
      ];

      plugin = {
        # Multi-monitor stuff
        split-monitor-workspaces = {
          count = 10;
          keep_focused = 0;
          enable_notifications = 0;
          enable_persistent_workspaces = 1;
        };
        # Window bars
        hyprbars = {
          # bar_part_of_window = true;
          # bar_precedent_over_border = true;
          bar_height = 38;
          on_double_click = "hyprctl dispatch fullscreen 1";
          bar_button_padding = 12;
          bar_padding = 10;
          bar_color = "rgb(${config.lib.stylix.colors.base01})";
          bar_title_enabled = false;
          hyprbars-button = [
            "rgb(${config.lib.stylix.colors.base08}), 23, 󰖭, hyprctl dispatch killactive, rgb(${config.lib.stylix.colors.base01})"
            "rgb(${config.lib.stylix.colors.base0A}), 23, , hyprctl dispatch fullscreen 1, rgb(${config.lib.stylix.colors.base01})"
            "rgb(${config.lib.stylix.colors.base0B}), 23, , hyprctl dispatch togglefloating, rgb(${config.lib.stylix.colors.base01})"
          ];
        };
      };

      monitor =
        [ "HDMI-A-3,2560x1330@60,0x0,1" "HDMI-A-2,2560x1330@60,2560x0,1" ];
      xwayland.force_zero_scaling = true;
      general = {
        # Borders etc
        border_size = 5;
        gaps_in = 25;
        gaps_out = "50,50,50,50";
      };
      # Decoration
      decoration = {
        rounding = 10;
        # inactive_opacity = 0.9;
        blur.size = 20;
      };

      # Window Rules
      windowrule = [
        # "hyprbars:bar_color rgb(${config.lib.stylix.colors.base0D}), match:focus 1"
        # "hyprbars:bar_color rgb(${config.lib.stylix.colors.base03}), match:focus 0"
        "workspace 20 silent, match:class com.rtosta.zapzap"
        "workspace 20 silent, match:class vesktop"
        "workspace 1 silent, match:class Spotify"
      ];

      # Set up Workspaces
      # workspace = [
      # ];

      input = {
        kb_options = "caps:escape";
        touchpad.natural_scroll = true;
      };
      "$mod" = "SUPER";
      "$GUI_EDITOR" = "emacs";
      exec-once = [
        "quickshell"
        "systemctl --user start awww"
        "systemctl --user start set-wallpaper"
        "zapzap"
        "vesktop"
        "spotify"
      ];
      # Caelestia binds

      _2launcher = {
        bindi = ["Super, Super_L, global, caelestia:launcher"];
        bindin = [
          "Super, catchall, global, caelestia:launcherInterrupt"
          "Super, mouse:272, global, caelestia:launcherInterrupt"
          "Super, mouse:273, global, caelestia:launcherInterrupt"
          "Super, mouse:274, global, caelestia:launcherInterrupt"
          "Super, mouse:275, global, caelestia:launcherInterrupt"
          "Super, mouse:276, global, caelestia:launcherInterrupt"
          "Super, mouse:277, global, caelestia:launcherInterrupt"
          "Super, mouse_up, global, caelestia:launcherInterrupt"
          "Super, mouse_down, global, caelestia:launcherInterrupt"
        ];
      };

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
        "$mod SHIFT, S, exec, caelestia shell picker openFreeze"
        "$mod CONTROL, S, exec, caelestia shell picker open"
        # "$mod SHIFT, S, exec, hyprshot -m region -o ~/Pictures/Screenshots/"
        # "$mod CONTROL, S, exec, hyprshot -m window -o ~/Pictures/Screenshots/"
        # ", Print, exec, hyprshot -m output -o ~/Pictures/Screenshots/"
        # # Window Rules
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
        "$mod SHIFT, tab, cyclenext, cyclenext"
        "$mod, s, togglefloating"
      # ];
        # Workspace rules
        "$mod, bracketright, split-cycleworkspacesnowrap, +1"
        "$mod, bracketleft, split-cycleworkspacesnowrap, -1"
        "$mod, SPACE, togglespecialworkspace"
        "$mod SHIFT, SPACE, movetoworkspace, special"

        # The 10th workspace
        "$mod, 0, split-workspace, 10"
        "$mod SHIFT, 0, split-movetoworkspacesilent, 10"
      ] ++ (
        builtins.concatLists (builtins.genList
          (x:
            let
              ws = builtins.toString (x + 1);
            in
            [
              "$mod, ${ws}, split-workspace, ${ws}"
              "$mod SHIFT, ${ws}, split-movetoworkspacesilent, ${ws}"
            ]) 9));
      # Miscallaneous settings
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        # background_color = "0x26233a";
      };
    };
  };
}
