(use-package nlinum
  :ensure t
  :config
  (setq nlinum--width 4)
  (add-hook 'prog-mode-hook '(lambda () (nlinum-mode t)))
  (setq line-number-mode nil))
