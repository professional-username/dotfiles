{ inputs, lib, config, pkgs, ... }: {

  # Enable home-manager self-management
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # Some useful cli programs
    nvim
    renameutils
    bottom
  ];
}
