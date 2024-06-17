{ inputs, config, pkgs, ... }:

{
  imports = [ ./hardware ./software ./localization ];

  # TODO Temporary overlay until PR merged (https://nixpk.gs/pr-tracker.html?pr=319882)
  nixpkgs.overlays = [
    (final: prev: {
      nodePackages = prev.nodePackages // {
        inherit (inputs.nixpkgs-fixes.legacyPackages.${prev.system}.nodePackages)
          bash-language-server;
      };
    })
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
