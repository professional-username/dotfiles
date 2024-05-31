{ inputs, lib, config, pkgs, ... }: {
  programs.firefox.enable = true;

  # Setup the default profile
  programs.firefox.profiles.default = {
    id = 0;
    name = "default";
    isDefault = true;
    settings = {
      # "browser.startup.homepage" = "https://duckduckgo.com";
      "browser.search.defaultenginename" = "DuckDuckGo";
      "browser.search.order.1" = "DuckDuckGo";

      "signon.rememberSignons" = false;
      # "widget.use-xdg-desktop-portal.file-picker" = 1;
      # "browser.aboutConfig.showWarning" = false;
      # "browser.compactmode.show" = true;
    };
    search = {
      force = true;
      default = "DuckDuckGo";
      order = [ "DuckDuckGo" ];
    };
  };
}
