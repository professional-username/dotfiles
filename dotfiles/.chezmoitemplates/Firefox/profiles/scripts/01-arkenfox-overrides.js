// Startup with previous pages
user_pref("browser.startup.page", 3); // 0102
// Enable search through the url bar
user_pref("keyword.enabled", true); // 0801
// Enable eme to enable videos
user_pref("media.eme.enabled", true); // 2022
// RFP overrides
user_pref("privacy.resistFingerprinting", false); // 4501
user_pref("privacy.resistFingerprinting.letterboxing", false); // 4504 [pointless if not using RFP]
user_pref("webgl.disabled", false); // 4520 [mostly pointless if not using RFP]
