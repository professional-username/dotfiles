{ inputs, lib, config, pkgs, ... }: {
  imports = [ ];

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, F, exec, firefox"
        "$mod, h, focuswindow, l"
        "$mod, j, focuswindow, d"
        "$mod, k, focuswindow, u"
        "$mod, l, focuswindow, r"
        "$mod, H, movewindow, l"
        "$mod, J, movewindow, d"
        "$mod, K, movewindow, u"
        "$mod, L, movewindow, r"
        "$mod, w, killactive"
      ] ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (x:
          let
            ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
          in [
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]) 10));
    };
  };
}
