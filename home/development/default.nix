{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ./devenv.nix
    ./git.nix
    ./languages.nix
    ./aider.nix
  ];

  programs.zed-editor.userSettings.buffer_font_family = lib.mkForce "Fira Code";
  programs.zed-editor.userSettings.buffer_font_size = lib.mkForce 16;
  programs.zed-editor.userSettings.theme = lib.mkForce "Base16 Rosé Pine";
  programs.zed-editor.userSettings.ui_font_size = lib.mkForce 16;

  programs.vscode.profiles.default.userSettings."workbench.colorTheme" = lib.mkForce "Stylix";
}
