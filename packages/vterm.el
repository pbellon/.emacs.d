(unless (on-windows)
  (unless (file-exists-p "emacs-libvterm/vterm.el")
    (message (shell-command-to-string "git submodule init")))
  (use-package vterm
    :ensure t
    :quelpa (vterm :fetcher file :path "emacs-libvterm/vterm.el")
  ))
