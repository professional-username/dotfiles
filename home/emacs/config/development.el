(use-package magit)

(use-package projectile
  :init
  (setq projectile-project-search-path '("~/Projects/"))
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map))

(use-package eglot
  :hook (prog-mode . eglot-ensure)
  :config
  (setq eglot-autoshutdown t)
  (setq eglot-confirm-server-initiated-edits nil))

(use-package apheleia
  :config
  (apheleia-global-mode +1))

(use-package company
  :after eglot
  :hook (eglot-managed-mode . company-mode)
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package flycheck
  :init (global-flycheck-mode))

