(use-package minions
  :ensure t
  :init (minions-mode)
  :config
  (setq minions-mode-line-lighter "#")
  (setq minions-direct '(flycheck-mode)))

(use-package moody
  :ensure t
  :config
  (setq x-underline-at-descent-line t)
  (setq moody-mode-line-height 22)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode moody-vc-mode))
