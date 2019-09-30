(use-package fill-column-indicator
  :ensure t
  :config
  (setq fci-rule-width 1)
  (setq fci-rule-color "#BBBBBB")
  (setq fci-rule-column 80)
  (defconst fci-padding-display
    '((when (not (fci-competing-overlay-p buffer-position))
        . (space :align-to (fci-column . width)))   ; <-- instead of `:align-to fci-column`
      (space :width 0)))
  (add-hook 'prog-mode-hook 'fci-mode))
