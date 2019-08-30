(use-package one-themes
  :ensure t
  :init
  (load-theme 'one-dark t))


(use-package smart-mode-line
  :after one-themes
  :ensure t
  :init
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'respectful)
  :config
  (sml/setup)
)

