(use-package fill-column-indicator
  :ensure t
  :config
  (setq fci-rule-width 1)
  (setq fci-rule-color "pink")
  (setq fci-rule-column 80)
  :config
  (add-hook 'prog-mode-hook 'fci-mode))
