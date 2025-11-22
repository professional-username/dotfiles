{ config, pkgs, ... }: {
  imports = [ ];
  programs.git = {
    enable = true;

    settings.user.email = "9hacahn5@anonaddy.me";
    settings.user.name = "professional-username";

    settings = { init.defaultBranch = "main"; };
  };
}
