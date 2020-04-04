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

(defun 2rgb ()
  "Convert color at position to rgb"
  (interactive)
  (let* ((bounds (if (use-region-p)
                     (cons (region-beginning) (region-end))
                   (bounds-of-thing-at-point 'symbol)))
         (text   (buffer-substring-no-properties (car bounds) (cdr bounds))))
    (when bounds
      (delete-region (car bounds) (cdr bounds))
      (insert
        (mapconcat (lambda (c) (format "%d" (* c 255))) (hexrgb-hex-to-rgb text) ", "))
      )
   )
)

;; took from https://www.reddit.com/r/emacs/comments/ft84xy/run_shell_command_in_new_vterm/
(defun run-in-vterm-kill (process event)
  "A process sentinel. Kills PROCESS's buffer if it is live."
  (let ((b (process-buffer process)))
    (and (buffer-live-p b)
         (kill-buffer b))))

;; took from https://www.reddit.com/r/emacs/comments/ft84xy/run_shell_command_in_new_vterm/
(defun run-in-vterm (command)
  "Execute string COMMAND in a new vterm.

Interactively, prompt for COMMAND with the current buffer's file
name supplied. When called from Dired, supply the name of the
file at point.

Like `async-shell-command`, but run in a vterm for full terminal features.

The new vterm buffer is named in the form `*foo bar.baz*`, the
command and its arguments in earmuffs.

When the command terminates, the shell remains open, but when the
shell exits, the buffer is killed."
  (interactive
   (list
    (let* ((f (cond (buffer-file-name)
                    ((eq major-mode 'dired-mode)
                     (dired-get-filename nil t))))
           (filename (concat " " (shell-quote-argument (and f (file-relative-name f))))))
      (read-shell-command "Terminal command: "
                          (cons filename 0)
                          (cons 'shell-command-history 1)
                          (list filename)))))
  (with-current-buffer (vterm (concat "*" command "*"))
    (set-process-sentinel vterm--process #'run-in-vterm-kill)
    (vterm-send-string command)
    (vterm-send-return)))
