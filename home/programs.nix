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
    spotify
    aider-chat
    hyprshot
    feh
    neofetch
    blender
    bambu-studio
  ];
}
