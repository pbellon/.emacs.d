;;; tree.el --- Configuration of dir/tree based navigation -*- lexical-binding: t; coding: utf-8 -*- 

;; (defun neotree-go-to-file ()
;;     "Change the neotree current folder to match the one of the current opened file"
;;     (interactive)
;;     (neotree-dir default-directory))

;; (use-package neotree
;;   :after (projectile all-the-icons)
;;   :ensure t
;;   :config
;;   (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;;   (global-set-key [f8] 'neotree-toggle)
;;   (setq neo-window-fixed-size nil)
;;   (setq projectile-switch-project-action 'neotree-projectile-action)
;;   (setq neo-hidden-regexp-list
;;     '(
;;       "^\\."
;;       "\\.pyc$"
;;       "~$"
;;       "^#.*#$"
;;       "\\.elc$"
;;       "\\.orig$"
;;       "node_modules/*"
;;       "session.*"
;;       "projectile.cache"
;;       "projectile-bookmarks.eld"
;;     )
;;   )
;;   (define-key neotree-mode-map (kbd "r")   'neotree-refresh)
;;   (define-key neotree-mode-map (kbd "s")   'neotree-enter-horizontal-split)
;;   (define-key neotree-mode-map (kbd "TAB") 'neotree-enter)
;;   (define-key neotree-mode-map (kbd "SPC") 'neotree-quick-look)
;;   (define-key neotree-mode-map (kbd "q")   'neotree-hide)
;;   (define-key neotree-mode-map (kbd "RET") 'neotree-enter)
;;   (define-key neotree-mode-map (kbd "g")   'neotree-refresh)
;;   (define-key neotree-mode-map (kbd "n")   'neotree-next-line)
;;   (define-key neotree-mode-map (kbd "p")   'neotree-previous-line)
;;   (define-key neotree-mode-map (kbd "A")   'neotree-stretch-toggle)
;;   (define-key neotree-mode-map (kbd "H")   'neotree-hidden-file-toggle)
;;   (define-key neotree-mode-map (kbd "R")   'neotree-change-root)
;;   (define-key neotree-mode-map (kbd "d")   'neotree-delete-node)

;;   (global-set-key (kbd "C-x n g") 'neotree-go-to-file)
;;   (global-set-key (kbd "C-x n f") 'neotree-find)
;; )


(use-package treemacs
  :ensure t
  :defer t
  :bind
  (:map global-map
    ("M-0" . treemacs-select-window)
    ("C-x t D" . treemacs-delete-other-windows)
    ("C-x t t" . treemacs)
    ("C-x t B" . treemacs-bookmark)
  )
)

(use-package treemacs-evil
  :after (evil treemacs)
  :ensure t
)

(use-package treemacs-projectile
  :after (projectile treemacs)
  :ensure t
)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)
