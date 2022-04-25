
;; setting coding-system
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

;; set to nil to convert DOS EOL to UNIX on save
(setq inhibit-eol-conversion 1)

(if (not (boundp 'server-process))
  (server-start))

;; (add-hook 'text-mode-hook 'remove-dos-eol)

(load "~/.emacs.d/functions.el")
(load "~/.emacs.d/keybindings.el")
(load "~/.emacs.d/packages.el")
(load "~/.emacs.d/hooks.el")
