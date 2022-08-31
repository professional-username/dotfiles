// Include all userscripts in order
{{ range (glob (joinPath .chezmoi.sourceDir ".chezmoitemplates/Firefox/profiles/prefs/*")) }}
{{ output "chezmoi" "execute-template" (include .) }}
{{ end }}
