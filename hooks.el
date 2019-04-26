;; Major modes config
(show-paren-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; submode hooks
(add-hook 'prog-mode 'hs-minor-mode)

(setq frame-title-format
      '(buffer-file-name "%f" (dired-directory direct-directy "%b")))

(setq-default indent-tabs-mode nil)

(setq indent-tabs-mode nil)


(defun set-mono-font ()
  "Apply a mono font to a buffer"
  (interactive)
  (setq buffer-face-mode-face '(:family "DejaVu Sans Mono" :height 24 :width semi-condensed))
  (buffer-face-mode))

(add-hook 'program-mode-hook 'set-mono-font)
