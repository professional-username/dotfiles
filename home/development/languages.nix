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
    nodePackages.bash-language-server # Bash
    nodePackages.yaml-language-server # Yaml
    sqls # SQL
    tailwindcss-language-server # Tailwind
    nodePackages.typescript-language-server # TypeScript/JavaScript, includes JSX support
    nodePackages.vscode-langservers-extracted # HTML/CSS/JSON
    nodePackages.eslint # JavaScript linter
    nodePackages.prettier # Code formatter
    nodePackages.stylelint # CSS/SCSS linter
    nodePackages.graphql-language-service-cli
    nodePackages.vls # Vite / Vite

    # Code formatters
    black # Python formatter
    isort # Python import sorter
    stylua # Lua formatter
    nixpkgs-fmt # Nix formatter
    rustfmt # Rust formatter
    gofumpt # Go formatter
    shfmt # Shell script formatter
  ];
}
