
;; ivy
(use-package ivy
  :ensure t
  :init
  (ivy-mode 1))


;; Line Number setup
(use-package nlinum
  :ensure t
  :config
  (setq nlinum--width 4)
  (add-hook 'prog-mode-hook '(lambda () (nlinum-mode t)))
  (setq line-number-mode nil))


(load "~/.emacs.d/packages/all-the-icons.el")
(load "~/.emacs.d/packages/asciidoc.el")
(load "~/.emacs.d/packages/cheat.el")
(load "~/.emacs.d/packages/evil.el")
(load "~/.emacs.d/packages/js.el")
(load "~/.emacs.d/packages/markdown.el")
(load "~/.emacs.d/packages/neotree.el")
(load "~/.emacs.d/packages/org-mode.el")
(load "~/.emacs.d/packages/plantuml.el")
(load "~/.emacs.d/packages/projectile.el")
(load "~/.emacs.d/packages/tide.el")
