{ inputs, config, pkgs, ... }: let
  tree-sitter-parsers = grammars: with grammars; [
    tree-sitter-bash
    tree-sitter-c
    tree-sitter-c-sharp
    tree-sitter-cmake
    tree-sitter-cpp
    tree-sitter-css
    tree-sitter-dot
    tree-sitter-elisp
    tree-sitter-glsl
    tree-sitter-haskell
    tree-sitter-html
    tree-sitter-java
    tree-sitter-javascript
    tree-sitter-json
    tree-sitter-json5
    tree-sitter-kotlin
    tree-sitter-latex
    tree-sitter-llvm
    tree-sitter-lua
    tree-sitter-make
    tree-sitter-markdown
    tree-sitter-markdown-inline
    tree-sitter-nickel
    tree-sitter-nix
    tree-sitter-prisma
    tree-sitter-python
    inputs.nix-qml-support.packages.${pkgs.stdenv.system}.tree-sitter-qmljs
    tree-sitter-regex
    tree-sitter-rust
    tree-sitter-scss
    tree-sitter-sql
    tree-sitter-toml
    tree-sitter-tsx
    tree-sitter-typescript
    tree-sitter-vim
    tree-sitter-yaml
    tree-sitter-zig
  ];

in {
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
      projectile # Project management
      company # Text completion framework
      doom-themes # Theme collection
      general # Key binding management
      apheleia # Formatting
      direnv # Direnv integration

      # Syntax etc
      eglot # LSP client
      flycheck # On-the-fly syntax checking
      flycheck-eglot
      flycheck-inline
      (treesit-grammars.with-grammars (grammars: tree-sitter-parsers grammars))

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

      # Org mode
      org
      org-roam

      # Openscad
      scad-mode

      # QML
      undo-tree
      inputs.nix-qml-support.packages.${pkgs.stdenv.system}.qml-ts-mode

      # Eye candy
      rainbow-mode
    ];
}
