(defun adoc/html ()
  "Generate the current asciidoc file with asciidoc"
  (interactive)
  (setq cmd (concat "source ~/opt/shell/setup.sh && activate-ruby-if-needed && bundle exec asciidoctor -b html5 " 
           (buffer-file-name)))
  (message (concat "Running command: " cmd))
  (setq res (shell-command-to-string cmd))
  (message res)
)

;; buffer management (bm)
;; load-file the current buffer file
(defun bm/load-buffer ()
  "Load the file associated to the current buffer"
  (interactive)
  (load-file buffer-file-name))
(global-set-key (kbd "C-x C-l") 'bm/load-buffer)  

;; bm/kill-this-buffer
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


(defun geo/depsjs ()
  "Run mvn geo:depsjs into aigle5-web/aigle-web-server"
  (interactive)
  (message (shell-command-to-string "cd ~/Dev/aigle5-web/aigle-web-server && mvn geo:depsjs")))
