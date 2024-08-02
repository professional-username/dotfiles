;; Increase garbage collection threshold
(setq gc-cons-threshold 100000000)

;; Temporarily disable file-name-handler-alist
(defvar default-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

;; Restore after startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold 800000)
            (setq file-name-handler-alist default-file-name-handler-alist)))
