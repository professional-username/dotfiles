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
      doom-themes # Theme collection
      general # Key binding management
      apheleia # Formatting

      # Treemacs and integrations
      treemacs
      treemacs-projectile
      treemacs-nerd-icons
      treemacs-evil

      # Better terminal
      vterm
      vterm-toggle

      # Additional useful packages
      which-key # Displays available keybindings
      helpful # Improved help system
      rainbow-delimiters # Colorizes nested parentheses

      # Additional language support
      nix-mode
    ];
}
