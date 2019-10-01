(use-package js2-mode
  :after (flycheck)
  :ensure t
  :hook (js2-mode . flycheck-mode)
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))
