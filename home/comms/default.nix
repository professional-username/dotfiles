{inputs, pkgs, ...}: {
  # Whatsapp
  home.packages = with pkgs; [
    zapzap
  ];

  programs.vesktop.enable = true;
}
