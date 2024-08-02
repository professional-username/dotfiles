(use-package general
  :config
  (general-create-definer my-leader-def
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (my-leader-def
    "f"  '(:ignore t :which-key "files")
    "ff" '(find-file :which-key "find file")
    "fr" '(recentf-open-files :which-key "recent files")
    "p"  '(:ignore t :which-key "project")
    "pf" '(projectile-find-file :which-key "find file in project")
    "ps" '(projectile-switch-project :which-key "switch project")
    "b"  '(:ignore t :which-key "buffer")
    "bb" '(switch-to-buffer :which-key "switch buffer")
    "bk" '(kill-buffer :which-key "kill buffer")
    "w"  '(:ignore t :which-key "window")
    "wl" '(windmove-right :which-key "move right")
    "wh" '(windmove-left :which-key "move left")
    "wk" '(windmove-up :which-key "move up")
    "wj" '(windmove-down :which-key "move down")
    "w/" '(split-window-right :which-key "split right")
    "w-" '(split-window-below :which-key "split below")
    "wd" '(delete-window :which-key "delete window")))

