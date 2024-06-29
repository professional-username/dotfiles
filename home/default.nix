# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule
    ./lvim
    ./firefox
    ./hyprland
    ./terminal
    ./devenv
  ];

  home = {
    username = "username";
    homeDirectory = "/home/username";
  };

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [ fira-code-nerdfont ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
