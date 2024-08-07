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

;; (defun utils/projectile-treemacs-switch-project-action ()
;;   "Switch to a project, replacing the current buffer.
;;    Opens the last visited file in the project or Dired if no file is found."
;;   (let* ((project-root (projectile-ensure-project (projectile-project-root)))
;;          (file (projectile-find-file-in-known-projects)))
;;     ;; Kill the current buffer
;;     ;; (kill-buffer (current-buffer))
;;     ;; Open either the last visited file or Dired
;;     (if file
;;         (find-file file)
;;       (dired project-root))
;;     ;; Optionally, you can add Treemacs integration here
;;     (when (fboundp 'treemacs-add-and-display-current-project)
;;       (treemacs-add-and-display-current-project))))

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

