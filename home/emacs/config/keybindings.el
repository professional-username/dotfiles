;; Keybindings
(use-package general
  :config
  (general-create-definer my-leader-def
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (my-leader-def
    "t"  '(vterm-toggle :which-key "Toggle vterm")
    "e"  '(treemacs :which-key "toggle treemacs")
    ";"  '(comment-line :which-key "comment line")
    ;; Files
    "f"  '(:ignore t :which-key "files")
    "ff" '(find-file :which-key "find file")
    "fr" '(recentf-open-files :which-key "recent files")
    ;; Org (roam)
    "o"  '(:ignore t :which-key "org")
    "oo" '(org-open-at-point :which-key "org follow link")
    "oc" '(org-roam-capture :which-key "org-roam capture")
    "oi" '(org-roam-node-insert :which-key "org-roam insert node")
    "of" '(org-roam-node-find :which-key "org-roam find node")
    "ot" '(org-roam-tag-add :which-key "org-roam add tags to file")
    "oT" '(org-roam-tag-remove :which-key "org-roam remove tags from file")
    ;; Magit
    "g" '(:ignore t :which-key "magit")
    "gg" '(magit-status :which-key "magit status")
    "gs" '(magit-stage-file :which-key "magit stage file")
    ;; Projectile
    "p"  '(:ignore t :which-key "project")
    "pf" '(projectile-find-file :which-key "find file in project")
    "ps" '(projectile-switch-project :which-key "switch project")
    "pr" '(projectile-run-project :Which-key "run project")
    "pt" '(projectile-test-project :Which-key "test project")
    "pc" '(projectile-compile-project :Which-key "compile project")
    ;; Buffers
    "b"  '(:ignore t :which-key "buffer")
    "bb" '(switch-to-buffer :which-key "switch buffer")
    "bk" '(kill-buffer :which-key "kill buffer")
    "bh" '(previous-buffer :which-key "previous buffer")
    "bl" '(next-buffer :which-key "next buffer")
    ;; Window moving rules
    "w"  '(:ignore t :which-key "window")
    "wl" '(windmove-right :which-key "move right")
    "wh" '(windmove-left :which-key "move left")
    "wk" '(windmove-up :which-key "move up")
    "wj" '(windmove-down :which-key "move down")
    "w/" '(split-window-right :which-key "split right")
    "w-" '(split-window-below :which-key "split below")
    "wc" '(delete-window :which-key "delete window")))
