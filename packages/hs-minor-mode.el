(add-hook 'prog-mode-hook #'hs-minor-mode)

(eval-after-load 'hideshow
  '(progn
     (global-set-key (kbd "C-c C-f") 'hs-toggle-hiding)))

(use-package fold-dwim
  :ensure t
  :config
)
