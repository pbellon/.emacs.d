(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (global-set-key (kbd "<C-tab>") 'company-indent-or-complete-common)
)
