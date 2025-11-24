;;; early-init.el --- Early startup tweaks -*- lexical-binding: t; -*-

;; Defer package.el so we control when it initializes.
(setq package-enable-at-startup nil)
(setq package-quickstart t)

;; Raise GC limits during init, reset after startup for snappier boot.
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 64 1024 1024)
                  gc-cons-percentage 0.1)))

;; Avoid frame resizing work during init and drop UI chrome ASAP.
(setq frame-inhibit-implied-resize t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(provide 'early-init)
;;; early-init.el ends here
