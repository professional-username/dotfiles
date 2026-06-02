{ inputs, lib, config, pkgs, ... }: {

  # Enable home-manager self-management
  programs.home-manager.enable = true;

  # TODO: Move this somewhere else
  programs.zathura.enable = true;
  programs.zathura.options = { "recolor" = true; };

  home.packages = with pkgs; [
    # Some useful cli programs
    neovim
    renameutils
    bottom
    tree
    fzf
    jrnl
    zotero
    # spotify
    hyprshot
    feh
    fastfetch
    # blender
    # bambu-studio
    godot
    aseprite
    pixi

    codex
    obs-studio
    vlc
    cookiecutter
    pipes

    jq

    unzip
    zip
    tokei
  ];
}
