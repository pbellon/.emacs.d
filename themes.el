;;; global theme
(defcustom use-light-theme nil
  "Check to use the light theme"
  :type 'bool
  :group 'theme
)
(setq use-light-theme nil)

(defun reload-theme ()
  "Forces emacs to reload the configured theme"
  (interactive)
  (if (not (eq use-light-theme nil))
    (load-theme 'one-light t)
    (load-theme 'one-dark t)
  )
)

(use-package one-themes
  :ensure t
  :init
  (reload-theme))

;;; mode lines

;; (use-package smart-mode-line
;;   :after one-themes
;;   :ensure t
;;   :init
;;   (setq sml/no-confirm-load-theme t)
;;   (setq sml/theme 'respectful)
;;   :config
;;   (sml/setup)
;; )

(use-package doom-modeline
  :ensure t
  :config
  (doom-modeline-mode 1))
