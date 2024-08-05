{ inputs, lib, config, pkgs, ... }: {
  # Setup the default profile
  programs.firefox.profiles = {
    username = {
      id = 0;
      name = "username";
      isDefault = true;

      search = {
        force = true;
        default = "DuckDuckGo";
        order = [ "DuckDuckGo" ];
      };

      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        bitwarden
        ublock-origin
        vimium-c
      ];

      # ---- PREFERENCES ----
      # Check about:config for options.
      settings = {
        # "browser.startup.homepage" = "https://duckduckgo.com";
        "layout.css.devPixelsPerPx" = 2.0;
        "browser.search.defaultenginename" = "DuckDuckGo";
        "browser.search.order.1" = "DuckDuckGo";

        "signon.rememberSignons" = false;
        # "widget.use-xdg-desktop-portal.file-picker" = 1;
        "browser.aboutConfig.showWarning" = false;
        # "browser.compactmode.show" = true;

        "extensions.pocket.enabled" = false;
        "extensions.screenshots.disabled" = true;

        "browser.topsites.contile.enabled" = false;
        "browser.formfill.enable" = false;
        "browser.search.suggest.enabled" = false;
        "browser.search.suggest.enabled.private" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.urlbar.showSearchSuggestionsFirst" = false;

        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.snippets" = false;

        "browser.newtabpage.activity-stream.section.highlights.rows" = false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" =
          false;
        "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" =
          false;
        "browser.newtabpage.activity-stream.section.highlights.includeDownloads" =
          false;
        "browser.newtabpage.activity-stream.section.highlights.includeVisited" =
          false;

        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.system.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      };
    };
  };
}
