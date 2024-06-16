{ inputs, lib, config, pkgs, ... }: {

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ nvchad nvchad-ui ];
  };

}
