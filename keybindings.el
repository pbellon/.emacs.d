; KEY BINDINGS
(global-set-key (kbd "C-c /") #'comment-or-uncomment-region)

;; toggle link display
(global-set-key (kbd "C-c L") #'org-toggle-link-display)

;; execute expression (under pointer)
(global-set-key (kbd "C-x C-e") #'eval-last-sexp)
;; execute region
(global-set-key (kbd "C-x C-r") #'eval-region)

(global-set-key (kbd "C-x C-k B") 'bm/kill-this-buffer)

;; window size management
(global-set-key (kbd "C-<kp-divide>") 'shrink-window-horizontally)
(global-set-key (kbd "C-<kp-multiply>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-<kp-subtract>") 'shrink-window)
(global-set-key (kbd "C-<kp-add>") 'enlarge-window)

;; maximize current window
(global-set-key (kbd "C-<kp-0>") 'maximize-window)
(global-set-key (kbd "C-<kp-decimal>") 'minimize-window)
