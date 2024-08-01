{ inputs, lib, config, pkgs, ... }: {
  imports = [ inputs.ags.homeManagerModules.default ];

  home.packages = with pkgs; [ sassc ];

  programs.ags = {
    enable = true;
    configDir = ../ags;
    extraPackages = with pkgs; [ gtksourceview webkitgtk accountsservice ];
  };

  # Add a file using the stylix colors
  home.file.".config/stylix-colors/colors.scss".text = let
    flattenDict = dict:
      let
        flattenEntry = name: value:
          if builtins.isAttrs value || builtins.isFunction value
          || !(builtins.match "base.." name != null) then
            ""
          else ''
            ''$${name}: ${toString value};
          '';
      in lib.strings.concatStrings
      (builtins.attrValues (builtins.mapAttrs flattenEntry dict));

    # Translate stylix colors to scss file
    colors = config.lib.stylix.colors.withHashtag;
    stringColors = flattenDict colors;

  in ''
    // Generated colors.sass using Stylix colors
    ${stringColors}
  '';

}
