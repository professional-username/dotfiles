;; Org mode settings

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/Projects/notes/"))
  :config
  (setq org-roam-capture-templates
        '(("d" "default" plain
           "%?"
           :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
           :unnarrowed t)
          ("t" "thought" plain
           "%?"
           :if-new (file+head
                    "thoughts/%<%Y%m%d%H%M%S>-${slug}.org"
                    "#+title: ${title}\n")
           :unnarrowed t)))
  (org-roam-db-autosync-mode))
