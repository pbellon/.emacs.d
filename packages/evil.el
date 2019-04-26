;; Evil conf
(use-package evil
  :ensure t
  :init
  (setq evil-search-module 'isearch
    evil-want-C-u-scroll t 
    evil-want-C-w-in-emacs-state t)
  (define-key global-map (kbd "C-." ) nil)
  (global-unset-key (kbd "C-."))
  (setq evil-want-keybinding nil)
  :config
  (global-set-key (kbd "C-x n RET") 'evil-next-buffer)
  (global-set-key (kbd "C-x N RET") 'evil-prev-buffer)
  (evil-mode 1))

;; Evil Numbers
(use-package evil-numbers
  :after evil
  :ensure t
  :config
  (global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
  (global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt))

;; Evil Collection
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))
