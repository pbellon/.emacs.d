;;; tree.el --- Configuration of dir/tree based navigation -*- lexical-binding: t; coding: utf-8 -*-

(use-package treemacs
  :ensure t
  :defer t
  :bind
  (:map global-map
    ("C-c f" . treemacs-select-window)
    ("C-x t D" . treemacs-delete-other-windows)
    ("<f8>" . treemacs)
    ("C-x t B" . treemacs-bookmark)
  )
)

(use-package treemacs-all-the-icons
  :ensure t
  :after (treemacs))

(use-package treemacs-projectile
  :after (projectile treemacs)
  :ensure t
)

(use-package treemacs-icons-dired
  :after (treemacs dired)
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)
