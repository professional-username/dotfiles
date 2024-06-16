{ inputs, config, pkgs, ... }:
let
  neovimconfig = import ../nvim;
  nvim = inputs.nixvim.legacyPackages.x86_64-linux.makeNixvimWithModule {
    inherit pkgs;
    module = neovimconfig;
  };
in {
  imports = [ ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.sessionVariables = { };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    nvim
    kitty
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
  ];

  home-manager.backupFileExtension = "hmBackup";

  # List services that you want to enable:

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    flake = "/home/username/.config/nixos-config";
  };

}
