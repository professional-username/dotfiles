// Include all userscripts in order
{{ range (glob (joinPath .chezmoi.sourceDir ".chezmoitemplates/Firefox/profiles/scripts/*")) }}
{{ include . }}
{{ end }}
