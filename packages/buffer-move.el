(use-package buffer-move
  :ensure t
  :config
  (global-set-key (kbd "<C-s-kp-up>") 'buf-move-up)
  (global-set-key (kbd "<C-s-kp-down>") 'buf-move-down)
  (global-set-key (kbd "<c-s-kp-left>") 'buf-move-left)
  (global-set-key (kbd "<C-s-kp-right>") 'buf-move-right))

(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "C-x C-w") 'ace-window))
