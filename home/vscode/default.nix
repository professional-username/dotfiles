{ inputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [ ];

  stylix.targets.vscode.enable = true;
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      esbenp.prettier-vscode
    ];
    # Make sure caps lock means escape as assigned by window manager
    userSettings = { keyboard.dispatch = "keyCode"; };
  };
}
