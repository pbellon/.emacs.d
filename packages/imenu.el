(use-package imenu-list
  :ensure t
  :config
  (global-set-key (kbd "C-{") #'imenu-list-smart-toggle)
  (setq imenu-list-auto-resize t)
  (setq imenu-list-position 'right))
