;; Check if running emacs on windows
(defun on-windows ()
  "Returns true if running emacs on windows"
  (memq system-type '(windows-nt ms-dos)))

;; buffer management (bm)
;; load-file the current buffer file
(defun bm/load-buffer ()
  "Load the file associated to the current buffer"
  (interactive)
  (load-file buffer-file-name))
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
