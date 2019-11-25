;; Check if running emacs on windows
(defun on-windows ()
  "Returns true if running emacs on windows"
  (memq system-type '(windows-nt ms-dos)))

;; buffer management (bm)
;; load-file the current buffer file
(defun bm/load-buffer ()
  "Load the file associated to the current buffer"
  (interactive)
  (eval-buffer (current-buffer)))
(global-set-key (kbd "C-x C-l") 'bm/load-buffer)  

;; kill the current buffer and quit its frame (with evil-quit)
(defun bm/kill-this-buffer ()
  "Will kill the current buffer then exit the killed buffer window."
  (interactive)
  (kill-buffer (current-buffer))
  (evil-quit))


(defvar config-file "~/.emacs.d/init.el")

(defun reload-config ()
  "Reload init.el"
  (interactive)
  (load-file config-file))


;;; Took from https://www.emacswiki.org/emacs/MoveLine
(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(defun switch-to-minibuffer ()
  "Switch to minibuffer window."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))
    (error "Minibuffer is not active")))
