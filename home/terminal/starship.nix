{ inputs, lib, config, pkgs, ... }: {
  imports = [ ];

  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      # Format settings
      add_newline = true;
      format = lib.concatStrings [
        "$all"
        "$username[@](bold dimmed green)"
        "$hostname"
        "$directory"
        "$character"
      ];

      directory = {
        read_only = "󰌾";
        home_symbol = "~";
      };

      username = {
        show_always = true;
        format = "[$user]($style)";
      };

      hostname = {
        ssh_only = false;
        ssh_symbol = "  ";
        format = "[$hostname](bold dimmed green) [$ssh_symbol](bold blue)";
      };

      # Language-specific nerd font symbols
      package = { symbol = "󰏗 "; };
      ocaml = { symbol = " "; };
      pijul_channel = { symbol = "' "; };
      perl = { symbol = " "; };
      python = { symbol = " "; };
      rlang = { symbol = "󰟔 "; };
      ruby = { symbol = " "; };
      rust = { symbol = " "; };
      scala = { symbol = " "; };
      spack = { symbol = "🅢 "; };
      aws = { symbol = "  "; };
      buf = { symbol = " "; };
      c = { symbol = " "; };
      conda = { symbol = " "; };
      dart = { symbol = " "; };
      docker_context = { symbol = " "; };
      elixir = { symbol = " "; };
      elm = { symbol = " "; };
      fossil_branch = { symbol = " "; };
      git_branch = { symbol = " "; };
      golang = { symbol = " "; };
      guix_shell = { symbol = " "; };
      haskell = { symbol = " "; };
      haxe = { symbol = "⌘ "; };
      hg_branch = { symbol = " "; };
      java = { symbol = " "; };
      julia = { symbol = " "; };
      lua = { symbol = " "; };
      memory_usage = { symbol = "󰍛 "; };
      meson = { symbol = "󰔷 "; };
      nim = { symbol = "󰆥 "; };
      nix_shell = { symbol = " "; };
      nodejs = { symbol = " "; };

      # OS nerd font symbols
      os.symbols = {
        Alpaquita = " ";
        Alpine = " ";
        Amazon = " ";
        Android = " ";
        Arch = " ";
        Artix = " ";
        CentOS = " ";
        Debian = " ";
        DragonFly = " ";
        Emscripten = " ";
        EndeavourOS = " ";
        Fedora = " ";
        FreeBSD = " ";
        Garuda = "󰛓 ";
        Gentoo = " ";
        HardenedBSD = "󰞌 ";
        Illumos = "󰈸 ";
        Linux = " ";
        Mabox = " ";
        Macos = " ";
        Manjaro = " ";
        Mariner = " ";
        MidnightBSD = " ";
        Mint = " ";
        NetBSD = " ";
        NixOS = " ";
        OpenBSD = "󰈺 ";
        openSUSE = " ";
        OracleLinux = "󰌷 ";
        Pop = " ";
        Raspbian = " ";
        Redhat = " ";
        RedHatEnterprise = " ";
        Redox = "󰀘 ";
        Solus = "󰠳 ";
        SUSE = " ";
        Ubuntu = " ";
      };
    };
  };
}
