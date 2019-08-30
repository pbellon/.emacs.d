;; we first need to be sure to have quelpa & quelpa-use-package 
;; installed in order to install
;; (manager/register 
;;  '(
;;    'all-the-icons
;;    'asciidoc
;;    'cheat
;;    'evil
;;    'fill-column-indicator
;;    'ibuffer
;;    'ivy
;;    'js
;;    'magit
;;    'markdown
;;    'neotree
;;    'nlinum-mode
;;    'org-mode
;;    'plantuml
;;    'projectile
;;    'tide
;;    )
;; )
;; (manager/setup)

;;; then we can install all dependencies & configure them
(load "~/.emacs.d/packages/editorconfig.el")
(load "~/.emacs.d/packages/all-the-icons.el")
(load "~/.emacs.d/packages/asciidoc.el")
(load "~/.emacs.d/packages/buffer-move.el")
(load "~/.emacs.d/packages/cheat.el")
(load "~/.emacs.d/packages/dashboard.el")
(load "~/.emacs.d/packages/evil.el")
(load "~/.emacs.d/packages/fill-column-indicator.el")
(load "~/.emacs.d/packages/ibuffer.el")
(load "~/.emacs.d/packages/ivy.el")
(load "~/.emacs.d/packages/js.el")
(load "~/.emacs.d/packages/magit.el")
(load "~/.emacs.d/packages/markdown.el")
(load "~/.emacs.d/packages/neotree.el")

(load "~/.emacs.d/packages/line-numbers.el")
(load "~/.emacs.d/packages/org-mode.el")
(load "~/.emacs.d/packages/plantuml.el")
(load "~/.emacs.d/packages/projectile.el")
(load "~/.emacs.d/packages/tide.el")
