(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'monokai t)

(use-package smart-mode-line
  :ensure t
  :config
  :init
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'respectful)
  :config
  (sml/setup)
)

