{ inputs, lib, config, pkgs, ... }: {
  home.packages = with pkgs; [
    # Language servers
    nixd # Nix
    haskell-language-server # Haskell
    clang-tools # Includes clangd for C/C++
    pyright # Python
    rust-analyzer # Rust
    gopls # Go
    metals # Scala
    jdt-language-server # Java
    lua-language-server # Lua
    bash-language-server # Bash
    yaml-language-server # Yaml
    sqls # SQL
    tailwindcss-language-server # Tailwind
    typescript-language-server # TypeScript/JavaScript, includes JSX support
    vscode-langservers-extracted # HTML/CSS/JSON
    eslint # JavaScript linter
    graphql-language-service-cli
    # vls # Vite / Vite
    stylelint # CSS/SCSS linter

    # Code formatters
    black # Python formatter
    prettier # Javascript / css / html etc
    isort # Python import sorter
    stylua # Lua formatter
    nixpkgs-fmt # Nix formatter
    rustfmt # Rust formatter
    gofumpt # Go formatter
    shfmt # Shell script formatter

    openscad-lsp
  ];
}
