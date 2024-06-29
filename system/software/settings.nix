{ config, pkgs, ... }: {
  imports = [ ];

  nix.settings.trusted-users = [ "root" "username" ];
}
