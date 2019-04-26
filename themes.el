(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(use-package smart-mode-line
  :ensure t
  :config
  :init
  (setq sml/no-confirm-load-theme t)
  (sml/setup))

(load-theme 'monokai t)
