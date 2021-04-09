(use-package magit
  :ensure t
  :bind (("C-x g" . 'magit-status))
  :config
  (setq vc-handled-backends (delq 'Git vc-handled-backends))
)
