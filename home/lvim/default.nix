{ inputs, lib, config, pkgs, ... }: {
  # Install relevant packages
  home.packages = with pkgs; [ lunarvim nixfmt-classic ];

  home.file.lvim-config = {
    source = ./dots;
    target = ".config/lvim";
    recursive = true;
  };

}
