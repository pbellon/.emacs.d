(use-package js2-mode
  :after (flycheck)
  :ensure t
  :config
  (add-hook 'js2-mode-hook #'flycheck-mode)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))
