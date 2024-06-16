{ inputs, lib, config, pkgs, ... }: {
  home.packages = with pkgs; [ nvim fira-code-nerdfont ];

  # Enable home-manager self-management
  programs.home-manager.enable = true;

}
