(use-package magit)

;; Projectile auto-add project to treemacs
(defun utils/add-projectile-project-to-treemacs ()
  "Add the current Projectile project to Treemacs workspace."
  (let ((project-root (projectile-project-root)))
    (when project-root
      (treemacs-add-and-display-current-project-exclusively))))

;; On switching projects, open last known file and treemacs
(defun utils/projectile-switch-project-action ()
  "Open Treemacs and the last visited file in the project."
  ;; (treemacs-add-and-display-current-project-exclusively)
  (let ((file (car (projectile-recentf-files))))
    (if file
        (find-file file)
      (projectile-find-file))))

;; Direnv integration
(use-package direnv
  :config
  (direnv-mode))

(use-package projectile
  :init
  (setq projectile-project-search-path '("~/Projects/"))
  :diminish projectile-mode
  :config (projectile-mode)
  :custom
  (projectile-completion-system 'ivy)
  (projectile-switch-project-action #'utils/projectile-switch-project-action)
  :hook
  (projectile-after-switch-project . utils/add-projectile-project-to-treemacs)
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

(use-package vterm
  :config
  (setq vterm-toggle-scope 'project)
  (define-key vterm-mode-map (kbd "C-i") 'vterm-send-next-key)
  :custom
  (vterm-shell "$SHELL")
  (vterm-always-compile-module t))

