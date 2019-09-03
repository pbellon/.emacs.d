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
  (global-set-key (kbd "<f5>") 'evil-ex-sort)
  (global-set-key (kbd "C-x n RET") 'evil-next-buffer)
  (global-set-key (kbd "C-x N RET") 'evil-prev-buffer)
  ;; deactivate evil when needed (lin
  (evil-set-initial-state 'ibuffer-mode 'normal)
  (evil-set-initial-state 'bookmark-bmenu-mode 'normal)
  (evil-set-initial-state 'dired-mode 'emacs)
  (evil-set-initial-state 'sunrise-mode 'emacs)
  (evil-mode 1)
)

;; Evil multiedit 
(use-package evil-multiedit
  :after evil
  :ensure t)

;; Evil Numbers
(use-package evil-numbers
  :after evil
  :ensure t
  :config
  (global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
  (global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt))


(use-package evil-multiedit
  :after evil
  :ensure t
  :config
  (evil-multiedit-default-keybinds))
  
;; Evil Collection
;; (use-package evil-collection
;;   :after evil
;;   :ensure t
;;   :config
;;   (evil-collection-init))
