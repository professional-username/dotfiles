{ inputs, lib, config, pkgs, ... }: {
  imports = [ ];

  programs.kitty = {
    enable = true;

    # Environment vars
    environment = { };

    extraConfig = ''
      window_border_width 5
      window_margin_width 10
      window_padding_width 20
      background_opacity 0.85
    '';

    # Font
    # font = { };
  };
}
