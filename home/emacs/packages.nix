{ config, pkgs, ... }: {
  # Install emacs packages
  programs.emacs.extraPackages = epkgs:
    with epkgs; [
      # Essential packages
      evil
      vertico
      orderless
      consult
      embark
      marginalia
      magit
      eglot
      projectile
      flycheck
      company
      treemacs
      doom-themes
      general

      # Additional useful packages
      which-key
      helpful
      rainbow-delimiters
    ];
}
