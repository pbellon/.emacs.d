;; Evil conf
;; (use-package evil
;;   :ensure t
;;   :init
;;   (setq evil-search-module 'isearch
;;     evil-want-C-u-scroll t 
;;     evil-want-C-w-in-emacs-state t)
;;   (define-key global-map (kbd "C-." ) nil)
;;   (global-unset-key (kbd "C-."))
;;   (setq evil-want-keybinding nil)
;;   :config
;;   (global-set-key (kbd "<f5>") 'evil-ex-sort)
;;   (global-set-key (kbd "C-x n RET") 'evil-next-buffer)
;;   (global-set-key (kbd "C-x N RET") 'evil-prev-buffer)
;;   ;; deactivate evil when needed
;;   (evil-set-initial-state 'ibuffer-mode 'emacs)
;;   (evil-set-initial-state 'bookmark-bmenu-mode 'emacs)
;;   (evil-set-initial-state 'dired-mode 'emacs)
;;   (evil-set-initial-state 'sunrise-mode 'emacs)
;;   (evil-set-initial-state 'neotree-mode 'emacs)
;;   (evil-set-initial-state 'dashboard-mode 'emacs)
;;   (evil-define-key 'insert global-map (kbd "<down>") 'evil-next-line)
;;   (evil-define-key 'insert global-map (kbd "<up>") 'evil-previous-line)
;;   (evil-define-key 'insert global-map (kbd "<left>") 'evil-backward-char)
;;   (evil-define-key 'insert global-map (kbd "<right>") 'evil-forward-char)
;;   (evil-define-command evil-vertical-split-buffer (buffer)
;;     "Switches to another buffer with vertical split"
;;     :repeat nil
;;     (interactive "<b>")
;;     (evil-window-vsplit)
;;     (evil-buffer buffer))
;;   (evil-ex-define-cmd "vsb[uffer]" 'evil-vertical-split-buffer)
;;   (evil-mode 1)
;; )

;; ;; Evil multiedit 
;; (use-package evil-multiedit
;;   :after evil
;;   :ensure t)

;; ;; Evil Numbers
;; (use-package evil-numbers
;;   :after evil
;;   :ensure t
;;   :config
;;   (global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
;;   (global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt))


;; (use-package evil-multiedit
;;   :after evil
;;   :ensure t
;;   :config
;;   (evil-multiedit-default-keybinds))
  
;; Evil Collection
;; (use-package evil-collection
;;   :after evil
;;   :ensure t
;;   :config
;;   (evil-collection-init))
