{
  config,
  pkgs,
  ...
}: {
  imports = [ ];
  programs.git = {
    enable = true;

    userEmail = "jv7edi9r@anonaddy.me";
    userName = "mirrored-basilisk";
  };
}
