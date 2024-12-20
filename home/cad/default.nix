{ pkgs, ... }: {
  imports = [
    # Manage CAD-related configs
    ./openscad.nix
    ./plasticity.nix
  ];
}
