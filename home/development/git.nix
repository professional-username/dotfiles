{ config, pkgs, ... }: {
  imports = [ ];
  programs.git = {
    enable = true;

    userEmail = "9hacahn5@anonaddy.me";
    userName = "professional-username";
  };
}
