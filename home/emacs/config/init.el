;; Scaling
(setq x-gtk-use-system-tooltips nil)

;; Initialize package sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)


;; Load settings
(load (expand-file-name "core.el" user-emacs-directory))
(load (expand-file-name "ui.el" user-emacs-directory))
(load (expand-file-name "keybindings.el" user-emacs-directory))
(load (expand-file-name "development.el" user-emacs-directory))
(load (expand-file-name "tools.el" user-emacs-directory))
