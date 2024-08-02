{ config, pkgs, ... }: {
  imports = [ ./packages.nix ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    extraConfig = ''
      (setenv "XDG_CONFIG_HOME" (expand-file-name "~/.config"))
    '';
  };

  home.file = {
    ".config/emacs/early-init.el".source = ./config/early-init.el;
    ".config/emacs/init.el".source = ./config/init.el;
    ".config/emacs/core.el".source = ./config/core.el;
    ".config/emacs/ui.el".source = ./config/ui.el;
    ".config/emacs/keybindings.el".source = ./config/keybindings.el;
    ".config/emacs/development.el".source = ./config/development.el;
    ".config/emacs/tools.el".source = ./config/tools.el;
  };
}
