(defun neotree-go-to-file ()
    "Change the neotree current folder to match the one of the current opened file"
    (interactive)
    (neotree-dir default-directory))
  

(use-package neotree
  :after (projectile evil all-the-icons)
  :ensure t
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (global-set-key [f8] 'neotree-toggle)
  (setq neo-window-fixed-size nil)
  (setq projectile-switch-project-action 'neotree-projectile-action)
  (setq neo-hidden-regexp-list
    '(
      "^\\."
      "\\.pyc$"
      "~$"
      "^#.*#$"
      "\\.elc$"
      "node_modules/*"
      "session.*"
      "projectile.cache"
      "projectile-bookmarks.eld"
    )
  )
  (evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "s") 'neotree-enter-horizontal-split)
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
  (evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
  (evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "R") 'neotree-change-root)
  (evil-define-key 'normal neotree-mode-map (kbd "d") 'neotree-delete-node)
  (global-set-key (kbd "C-x n g") 'neotree-go-to-file)
  (global-set-key (kbd "C-x n f") 'neotree-find)
)
