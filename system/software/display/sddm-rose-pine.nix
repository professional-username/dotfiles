{ stdenvNoCC, fetchFromGitHub, lib, libsForQt5, pkgs }:

stdenvNoCC.mkDerivation rec {
  pname = "sddm-rose-pine-theme";
  version = "1.2";
  dontBuild = true;

  propagatedUserEnvPkgs = [ libsForQt5.qt5.qtgraphicaleffects ];

  src = fetchFromGitHub {
    owner = "lwndhrst";
    repo = "sddm-rose-pine";
    rev = "v${version}";
    sha256 = "+WOdazvkzpOKcoayk36VLq/6lLOHDWkDykDsy8p87JE=";
  };

  configOverride = builtins.readFile ./sddm-overrides.conf;

  installPhase = ''
    mkdir -p $out/share/sddm/themes/rose-pine
    # First copy the cutom config,
    # because once the source is copied the permissions are fucked
    echo "${configOverride}" > $out/share/sddm/themes/rose-pine/theme.conf
    # Then copy the source without overriding existing files,
    # Leaving our custom config in place
    cp -Rn $src/* $out/share/sddm/themes/rose-pine/
  '';
}
