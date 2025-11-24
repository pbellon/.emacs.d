(if (fboundp 'make-closure)
    (use-package doom-themes
      :ensure t
      ;; Global settings (defaults)
      :config
      (setq doom-themes-enable-bold t)    ; if nil, bold is universally disabled
      (setq doom-themes-enable-italic t) ; if nil, italics is universally disabled

      (load-theme 'doom-solarized-light t)

      ;; Corrects (and improves) org-mode's native fontification.
      (doom-themes-org-config))
  ;; Fallback for older Emacs builds lacking lexical closures (e.g. Emacs 26).
  (progn
    (load-theme 'deeper-blue t)
    (message "doom-themes skipped: requires Emacs 27+ (missing make-closure).")))

(setq frame-title-format
      '(buffer-file-name "%f" (dired-directory direct-directy "%b")))
