;;; Fonts
(straight-use-package '(nano-emacs :type git :host github :repo "rougier/nano-emacs"))

(require 'nano-layout)
(require 'nano-theme-dark)
(require 'nano-faces)
(nano-faces)

(require 'nano-theme)
(nano-theme)

(require 'nano-modeline)
(require 'nano-splash)

(when tool-bar-mode
  (tool-bar-mode -1))

(when scroll-bar-mode
  (scroll-bar-mode -1))

(setq frame-title-format
      '(buffer-file-name "%f" (dired-directory direct-directy "%b")))
