
(use-package smart-mode-line
  :ensure t
  :config
  :init
  (load-theme 'monokai t)
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'respectful)
  :config
  (sml/setup)
)

