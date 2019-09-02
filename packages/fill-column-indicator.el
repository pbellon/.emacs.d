(use-package fill-column-indicator
  :ensure t
  :init
  (setq fci-rule-width 1)
  (setq fci-rule-color "pink")
  (setq fci-rule-column 80)
  (defconst fci-padding-display
    '((when (not (fci-competing-overlay-p buffer-position))
        . (space :align-to (fci-column . width)))   ; <-- instead of `:align-to fci-column`
      (space :width 0)))
  :config
  (add-hook 'prog-mode-hook 'fci-mode))
