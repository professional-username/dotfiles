{ config, pkgs, ... }: {
  # Install emacs packages
  programs.emacs.extraPackages = epkgs:
    with epkgs; [
      # Essential packages
      evil # Vim emulation layer
      ivy # Vertical completion UI
      orderless # Flexible completion style
      consult # Search and navigation commands
      embark # Context-aware action menu
      marginalia # Annotations for minibuffer completions
      magit # Git interface
      eglot # LSP client
      projectile # Project management
      flycheck # On-the-fly syntax checking
      company # Text completion framework
      treemacs # Tree-style file explorer sidebar
      treemacs-projectile # Treemacs projectile integration
      treemacs-nerd-icons
      doom-themes # Theme collection
      general # Key binding management
      apheleia # Formatting

      # Additional useful packages
      which-key # Displays available keybindings
      helpful # Improved help system
      rainbow-delimiters # Colorizes nested parentheses
    ];
}
