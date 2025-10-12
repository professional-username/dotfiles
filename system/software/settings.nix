{ config, pkgs, ... }: {
  imports = [ ];

  nix.settings.trusted-users = [ "root" "username" ];

  # Premissions for screen recording
  security.wrappers.gsr-kms-server = {
    source = "${pkgs.gpu-screen-recorder}/bin/gsr-kms-server";
    capabilities = "cap_sys_admin+ep";
    owner = "root";
    group = "root";
    permissions = "0755";
  };

}
