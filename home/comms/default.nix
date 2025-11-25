{inputs, pkgs, ...}: {
  # Whatsapp
  home.packages = with pkgs; [
    zapzap
  ];

  # TODO: Add vesktop
}
