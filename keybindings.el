;; KEY BINDINGS

;;;; Buffers / Frames

;; window size management
(global-set-key (kbd "C-c C-w C-p") 'shrink-window-horizontally)
(global-set-key (kbd "C-*") 'enlarge-window-horizontally)
(global-set-key (kbd "C--") 'shrink-window)
(global-set-key (kbd "C-+") 'enlarge-window)

;; maximize current window
(global-set-key (kbd "C-=") 'maximize-window)
(global-set-key (kbd "C-\\") 'minimize-window)
(define-key ctl-x-4-map "t" 'toggle-window-split)


;; execute expression (under pointer)
(define-key emacs-lisp-mode-map (kbd "C-c C-e") 'eval-last-sexp)
(define-key emacs-lisp-mode-map (kbd "C-c C-r") 'eval-region)
(define-key emacs-lisp-mode-map (kbd "C-c C-b") 'eval-buffer)

;; ALT+F4 binding, also bound to C-x C-c
(global-set-key (kbd "M-<f4>") 'save-buffers-kill-terminal) 

;; general edition keybindings
(global-set-key (kbd "<f5>") 'sort-lines)
(global-set-key (kbd "C-c C-/") #'comment-or-uncomment-region)
(global-set-key (kbd "M-<up>") #'move-line-up)
(global-set-key (kbd "M-<down>") #'move-line-down)

(global-set-key (kbd "C-c C-c b") #'switch-to-minibuffer)
(global-set-key (kbd "C-c C-g") #'magit-status)
(global-set-key (kbd "C-x C-/") #'revert-buffer)


;;; Defines list of kbd translations for special unicode chars.
(define-key key-translation-map (kbd "<f9> p") (kbd "φ"))
(define-key key-translation-map (kbd "<f9> d") (kbd "Δ"))
