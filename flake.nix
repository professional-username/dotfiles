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
    # Sddm theme
    # sddm-sugar-candy-nix = {
    #   url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
    #   # Optional, by default this flake follows nixpkgs-unstable.
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # # AGS for widgets
    ags.url = "github:Aylur/ags/v1";
    # Custom sddm
    silentSDDM.url = "github:uiriansan/SilentSDDM";
    silentSDDM.inputs.nixpkgs.follows = "nixpkgs";
    # Hyprland multiple monitor support
    hyprland.url = "github:hyprwm/Hyprland";
    split-monitor-workspaces.url = "github:Duckonaut/split-monitor-workspaces";
    split-monitor-workspaces.inputs.hyprland.follows = "hyprland"; # <- make sure this line is present for the plugin to work as intended
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs:
    let
      inherit (self) outputs;
      defaultWallpaper = ./images/wallpaper_default.jpg;
    in {
      # NixOS configuration entrypoint
      nixosConfigurations = {
        # Config for gpteapot system
        apollo = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs defaultWallpaper; };
          modules = [
            # System-level configuration
            ./system/configuration.nix
            # sddm-sugar-candy-nix.nixosModules.default

            # Stylix
            stylix.nixosModules.stylix

            home-manager.nixosModules.home-manager
            {
              # Home manager modules
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
