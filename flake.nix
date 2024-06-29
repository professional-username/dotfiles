{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # Stylix
    stylix.url = "github:danth/stylix";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # Firefox addons flake
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # AGS for widgets
    ags.url = "github:Aylur/ags";
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs:
    let inherit (self) outputs;
    in {
      # NixOS configuration entrypoint
      nixosConfigurations = {
        # Config for gpteapot system
        gpteapot = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            # System-level configuration
            ./system/configuration.nix

            # Stylix
            stylix.nixosModules.stylix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };
              # User-specific configs
              home-manager.users.username = import ./home;
            }
          ];
        };

      };
    };
}
