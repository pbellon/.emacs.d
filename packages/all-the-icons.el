
(use-package all-the-icons
  :ensure t
  :config
  ;; took from https://github.com/domtronn/all-the-icons.el/issues/120#issuecomment-480342779
  (unless (member "all-the-icons" (font-family-list))
    (all-the-icons-install-fonts t))
)
