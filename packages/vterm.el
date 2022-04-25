(defun vterm-send-:q ()
  "Sends :q to vterm"
  (interactive)
  (vterm-send-string ":q")
  (vterm-send-key "<enter>")
)

(defun vterm-buffer-open-or-create ()
  "Opens the <vterm> buffer if exists or create it"
  (interactive)
  
  (let* (b (get-buffer-create "vterm"))
    (switch-to-buffer b)
    (if (not (string-equal major-mode "vterm-mode"))
      (vterm))))
    

(unless (on-windows)
  (unless (file-exists-p "emacs-libvterm/vterm.el")
    (message (shell-command-to-string "git submodule init")))
  (use-package vterm
    :straight t)
)
