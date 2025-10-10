{ inputs, pkgs, config, ... }:
{
  imports = [
    # ./ags # Replace with quickshell
    inputs.caelestia-nix.homeManagerModules.default
  ];

  home.packages = [
    inputs.quickshell.packages.${pkgs.system}.default
  ];

  programs.caelestia-dots = {
    enable = true;

    hypr.enable = false;

    hypr.hyprland.keybinds.enable = true;

    hypr.settings.scheme = {
        primary_paletteKeyColor = config.lib.stylix.colors.base08;
        secondary_paletteKeyColor = config.lib.stylix.colors.base0D;
        tertiary_paletteKeyColor = config.lib.stylix.colors.base0E;
        neutral_paletteKeyColor = config.lib.stylix.colors.base03;
        neutral_variant_paletteKeyColor = config.lib.stylix.colors.base04;

        background = config.lib.stylix.colors.base00;
        onBackground = config.lib.stylix.colors.base05;

        surface = config.lib.stylix.colors.base00;
        surfaceDim = config.lib.stylix.colors.base00;
        surfaceBright = config.lib.stylix.colors.base01;
        surfaceContainerLowest = config.lib.stylix.colors.base00;
        surfaceContainerLow = config.lib.stylix.colors.base01;
        surfaceContainer = config.lib.stylix.colors.base02;
        surfaceContainerHigh = config.lib.stylix.colors.base03;
        surfaceContainerHighest = config.lib.stylix.colors.base04;

        onSurface = config.lib.stylix.colors.base05;
        surfaceVariant = config.lib.stylix.colors.base02;
        onSurfaceVariant = config.lib.stylix.colors.base06;

        inverseSurface = config.lib.stylix.colors.base07;
        inverseOnSurface = config.lib.stylix.colors.base00;

        outline = config.lib.stylix.colors.base03;
        outlineVariant = config.lib.stylix.colors.base04;

        shadow = config.lib.stylix.colors.base00;
        scrim = config.lib.stylix.colors.base00;

        surfaceTint = config.lib.stylix.colors.base08;

        primary = config.lib.stylix.colors.base08;
        onPrimary = config.lib.stylix.colors.base00;
        primaryContainer = config.lib.stylix.colors.base08;
        onPrimaryContainer = config.lib.stylix.colors.base07;
        inversePrimary = config.lib.stylix.colors.base09;

        secondary = config.lib.stylix.colors.base0D;
        onSecondary = config.lib.stylix.colors.base00;
        secondaryContainer = config.lib.stylix.colors.base0D;
        onSecondaryContainer = config.lib.stylix.colors.base07;

        tertiary = config.lib.stylix.colors.base0E;
        onTertiary = config.lib.stylix.colors.base00;
        tertiaryContainer = config.lib.stylix.colors.base0E;
        onTertiaryContainer = config.lib.stylix.colors.base07;

        error = config.lib.stylix.colors.base0F;
        onError = config.lib.stylix.colors.base00;
        errorContainer = config.lib.stylix.colors.base08;
        onErrorContainer = config.lib.stylix.colors.base07;

        primaryFixed = config.lib.stylix.colors.base06;
        primaryFixedDim = config.lib.stylix.colors.base08;
        onPrimaryFixed = config.lib.stylix.colors.base00;
        onPrimaryFixedVariant = config.lib.stylix.colors.base02;

        secondaryFixed = config.lib.stylix.colors.base06;
        secondaryFixedDim = config.lib.stylix.colors.base0D;
        onSecondaryFixed = config.lib.stylix.colors.base00;
        onSecondaryFixedVariant = config.lib.stylix.colors.base02;

        tertiaryFixed = config.lib.stylix.colors.base06;
        tertiaryFixedDim = config.lib.stylix.colors.base0E;
        onTertiaryFixed = config.lib.stylix.colors.base00;
        onTertiaryFixedVariant = config.lib.stylix.colors.base02;

        term0 = config.lib.stylix.colors.base00;
        term1 = config.lib.stylix.colors.base08;
        term2 = config.lib.stylix.colors.base0B;
        term3 = config.lib.stylix.colors.base0A;
        term4 = config.lib.stylix.colors.base0D;
        term5 = config.lib.stylix.colors.base0E;
        term6 = config.lib.stylix.colors.base0C;
        term7 = config.lib.stylix.colors.base05;
        term8 = config.lib.stylix.colors.base03;
        term9 = config.lib.stylix.colors.base08;
        term10 = config.lib.stylix.colors.base0B;
        term11 = config.lib.stylix.colors.base0A;
        term12 = config.lib.stylix.colors.base0D;
        term13 = config.lib.stylix.colors.base0E;
        term14 = config.lib.stylix.colors.base0C;
        term15 = config.lib.stylix.colors.base07;

        rosewater = config.lib.stylix.colors.base0A;
        flamingo = config.lib.stylix.colors.base08;
        pink = config.lib.stylix.colors.base0E;
        mauve = config.lib.stylix.colors.base0E;
        red = config.lib.stylix.colors.base08;
        maroon = config.lib.stylix.colors.base08;
        peach = config.lib.stylix.colors.base09;
        yellow = config.lib.stylix.colors.base0A;
        green = config.lib.stylix.colors.base0B;
        teal = config.lib.stylix.colors.base0C;
        sky = config.lib.stylix.colors.base0D;
        sapphire = config.lib.stylix.colors.base0C;
        blue = config.lib.stylix.colors.base0D;
        lavender = config.lib.stylix.colors.base06;

        text = config.lib.stylix.colors.base05;
        subtext1 = config.lib.stylix.colors.base04;
        subtext0 = config.lib.stylix.colors.base03;
        overlay2 = config.lib.stylix.colors.base03;
        overlay1 = config.lib.stylix.colors.base02;
        overlay0 = config.lib.stylix.colors.base01;

        surface2 = config.lib.stylix.colors.base02;
        surface1 = config.lib.stylix.colors.base01;
        surface0 = config.lib.stylix.colors.base00;

        base = config.lib.stylix.colors.base00;
        mantle = config.lib.stylix.colors.base01;
        crust = config.lib.stylix.colors.base02;

        success = config.lib.stylix.colors.base0B;
        onSuccess = config.lib.stylix.colors.base00;
        successContainer = config.lib.stylix.colors.base01;
        onSuccessContainer = config.lib.stylix.colors.base06;
    };

    caelestia.shell.settings = {
      background.enabled = false;
      bar.status = {
        showBattery = false;
      };
    };
  };

  # home.file.".config/quickshell/" = {
  #   source = ./config;
  #   recursive = false;
  #   force = true;
  # };

  stylix.targets.qt.enable = true;
}
