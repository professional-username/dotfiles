;; UI settings
(scroll-bar-mode -1)
(tool-bar-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

(setq visible-bell t)

(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package treemacs-nerd-icons
  :config
  (treemacs-load-theme "nerd-icons"))


(use-package treemacs
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-follow-delay             0.2
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-read-string-input             'from-child-frame
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-width                         35)
    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))))

;; Treemacs evil integration
(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

;; Transparent background
(add-hook 'after-init-hook
          (lambda ()
            (set-frame-parameter nil 'alpha-background 85)
            (add-to-list 'default-frame-alist '(alpha-background . 85))))

;; Nerd icon colors
(defun utils/set-nerd-icons-colors ()
  "Set nerd-icons colors based on the stylix base16 theme."
  (when (bound-and-true-p base16-stylix-theme-colors)
    (let ((base00 (plist-get base16-stylix-theme-colors :base00))
          (base01 (plist-get base16-stylix-theme-colors :base01))
          (base02 (plist-get base16-stylix-theme-colors :base02))
          (base03 (plist-get base16-stylix-theme-colors :base03))
          (base04 (plist-get base16-stylix-theme-colors :base04))
          (base05 (plist-get base16-stylix-theme-colors :base05))
          (base06 (plist-get base16-stylix-theme-colors :base06))
          (base07 (plist-get base16-stylix-theme-colors :base07))
          (base08 (plist-get base16-stylix-theme-colors :base08))
          (base09 (plist-get base16-stylix-theme-colors :base09))
          (base0A (plist-get base16-stylix-theme-colors :base0A))
          (base0B (plist-get base16-stylix-theme-colors :base0B))
          (base0C (plist-get base16-stylix-theme-colors :base0C))
          (base0D (plist-get base16-stylix-theme-colors :base0D))
          (base0E (plist-get base16-stylix-theme-colors :base0E))
          (base0F (plist-get base16-stylix-theme-colors :base0F)))

      ;; Note: colors are not perfect, but at least they are consistent
      ;; Could use some improvement with e.g. darken / lighten functions
      (set-face-foreground 'nerd-icons-dsilver base04)
      (set-face-foreground 'nerd-icons-silver base05)
      (set-face-foreground 'nerd-icons-lsilver base06)

      (set-face-foreground 'nerd-icons-dgreen base0B)
      (set-face-foreground 'nerd-icons-green base0B)
      (set-face-foreground 'nerd-icons-lgreen base0B)
      
      (set-face-foreground 'nerd-icons-dblue base0B)
      (set-face-foreground 'nerd-icons-blue base0B)
      (set-face-foreground 'nerd-icons-lblue base0B)
      (set-face-foreground 'nerd-icons-blue-alt base0B)

      (set-face-foreground 'nerd-icons-dmaroon base0A)
      (set-face-foreground 'nerd-icons-maroon base0A)
      (set-face-foreground 'nerd-icons-lmaroon base0A)

      (set-face-foreground 'nerd-icons-dpurple base0D)
      (set-face-foreground 'nerd-icons-purple base0D)
      (set-face-foreground 'nerd-icons-lpurple base0D)
      (set-face-foreground 'nerd-icons-purple-alt base0D)

      (set-face-foreground 'nerd-icons-dorange base09)
      (set-face-foreground 'nerd-icons-orange base09)
      (set-face-foreground 'nerd-icons-lorange base09)

      (set-face-foreground 'nerd-icons-cyan base0C)
      (set-face-foreground 'nerd-icons-dcyan base0C)
      (set-face-foreground 'nerd-icons-lcyan base0C)
      (set-face-foreground 'nerd-icons-cyan-alt base0C)

      (set-face-foreground 'nerd-icons-yellow base0E)
      (set-face-foreground 'nerd-icons-dyellow base0E)
      (set-face-foreground 'nerd-icons-lyellow base0E)

      (set-face-foreground 'nerd-icons-dred base08)
      (set-face-foreground 'nerd-icons-red base08)
      (set-face-foreground 'nerd-icons-lred base08)
      (set-face-foreground 'nerd-icons-red-alt base08)

      (set-face-foreground 'nerd-icons-dpink base0A)
      (set-face-foreground 'nerd-icons-pink base0A)
      (set-face-foreground 'nerd-icons-lpink base0A)
      )))

(add-hook 'after-init-hook 'utils/set-nerd-icons-colors)
