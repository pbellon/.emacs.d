(use-package adoc-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist (cons "\\.txt\\'" 'adoc-mode))
  (add-to-list 'auto-mode-alist (cons "\\.adoc\\'" 'adoc-mode))
  (add-hook 'adoc-mode-hook (lambda () (buffer-face-mode t))))
