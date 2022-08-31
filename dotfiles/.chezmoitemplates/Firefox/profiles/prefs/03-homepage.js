// Set the default homepage to a custom html document
user_pref(
  "browser.startup.homepage",
  "{{- joinPath .chezmoi.homeDir ".config/firefox/home.html" -}}"
);
