{ config, pkgs, ... }:

{
  imports = [ ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set session variables
  environment.sessionVariables = { EDITOR = "nvim"; };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [ git neovim kitty ];

  home-manager.backupFileExtension = "hmBackup";

  # List services that you want to enable:

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  programs.steam.enable = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    flake = "/home/username/.config/nixos-config";
  };

}
