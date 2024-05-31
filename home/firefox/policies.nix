{ inputs, lib, config, pkgs, ... }:
let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
in {
  programs.firefox.package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
    # ---- POLICIES ----
    # Check about:policies#documentation for options.
    extraPolicies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
      DisplayMenuBar =
        "default-off"; # alternatives: "always", "never" or "default-on"
      SearchBar = "unified"; # alternative: "separate"

      # Preferences = {
      #   "extensions.pocket.enabled" = lock-false;
      #   "extensions.screenshots.disabled" = lock-true;
      #   "browser.topsites.contile.enabled" = lock-false;
      #   "browser.formfill.enable" = lock-false;
      #   "browser.search.suggest.enabled" = lock-false;
      #   "browser.search.suggest.enabled.private" = lock-false;
      #   "browser.urlbar.suggest.searches" = lock-false;
      #   "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
      #   "browser.newtabpage.activity-stream.feeds.section.topstories" =
      #     lock-false;
      #   "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
      #   "browser.newtabpage.activity-stream.section.highlights.rows" =
      #     lock-false;
      #   "browser.newtabpage.activity-stream.section.highlights.includePocket" =
      #     lock-false;
      #   "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" =
      #     lock-false;
      #   "browser.newtabpage.activity-stream.section.highlights.includeDownloads" =
      #     lock-false;
      #   "browser.newtabpage.activity-stream.section.highlights.includeVisited" =
      #     lock-false;
      #   "browser.newtabpage.activity-stream.showSponsored" = lock-false;
      #   "browser.newtabpage.activity-stream.system.showSponsored" =
      #     lock-false;
      #   "browser.newtabpage.activity-stream.showSponsoredTopSites" =
      #     lock-false;
      # };
    };
  };
}
