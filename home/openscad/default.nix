{ inputs, lib, config, pkgs, ... }:

let
  scad-constructive = pkgs.fetchurl {
    url =
      "https://raw.githubusercontent.com/solidboredom/constructive/refs/heads/main/constructive-compiled.scad";
    sha256 = "04ld38krjl1a8ic5cvli8i3zl0y5nc4mjrjal3d03nbbp3bkh32h";
    # owner = "solidboredom";
    # repository = "constructive";
    # rev = "main";
  };

in {
  #
  home.packages = with pkgs; [ openscad ];
  home.sessionVariables = {
    OPENSCADPATH = "$HOME/.config/OpenSCAD/libraries/";
  };

  home.file."constructive-compiled.scad" = {
    source = "${scad-constructive}";
    target = ".config/OpenSCAD/libraries/constructive-compiled.scad";
  };

}
