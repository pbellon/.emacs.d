(use-package doom-themes
  :straight t
  :ensure t
  ;; Global settings (defaults)
  :config
  (setq doom-themes-enable-bold t)    ; if nil, bold is universally disabled
  (setq doom-themes-enable-italic t) ; if nil, italics is universally disabled

  (load-theme 'doom-solarized-light t)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)
)

(when menu-bar-mode
  (menu-bar-mode -1))

(when tool-bar-mode
  (tool-bar-mode -1))

(when scroll-bar-mode
  (scroll-bar-mode -1))

(setq frame-title-format
      '(buffer-file-name "%f" (dired-directory direct-directy "%b")))
