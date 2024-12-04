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
  :config
  (projectile-mode)
  (setq projectile-project-run-cmd "project-run")
  (setq projectile-project-test-cmd "project-test")
  (setq projectile-project-compile-cmd "project-compile")
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
  (setq eglot-confirm-server-initiated-edits nil)
  ;; Show tooltips
  (tooltip-mode 1)
  (setq help-at-pt-timer-delay 0.1)
  (setq help-at-pt-display-when-idle '(flymake-diagnostic flycheck-diagnostic)))

(use-package flycheck
  :config
  (tooltip-mode 1)
  (add-hook 'flycheck-mode-hook #'flycheck-inline-mode)
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package flycheck-eglot
  :ensure t
  :after (flycheck eglot)
  :config
  ;; (setq flycheck-eglot-exclusive nil)
  (global-flycheck-eglot-mode 1))

(use-package apheleia
  :config
  (apheleia-global-mode +1)
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 4))

(use-package company
  :after eglot
  :hook (eglot-managed-mode . company-mode)
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package vterm
  :config
  (setq vterm-toggle-scope 'project)
  (define-key vterm-mode-map (kbd "C-i") 'vterm-send-next-key)
  :custom
  (vterm-shell "$SHELL")
  (vterm-always-compile-module t))

(use-package scad-mode
  :ensure t
  :bind (:map scad-preview-mode-map
              ("M-l" . scad-preview-translate-x+)
              ("M-h" . scad-preview-translate-x-)
              ("M-k" . scad-preview-translate-y+)
              ("M-j" . scad-preview-translate-y-)
              ("M-p" . scad-preview-translate-z+)
              ("M-n" . scad-preview-translate-z-)

              ("C-h" . scad-preview-rotate-z-)
              ("C-j" . scad-preview-rotate-x-)
              ("C-k" . scad-preview-rotate-x+)
              ("C-l" . scad-preview-rotate-z+)

              ("C-M-k" . scad-preview-distance+)
              ("C-M-j" . scad-preview-distance-)

              ("C-;" . scad-preview-projection)
              ))

