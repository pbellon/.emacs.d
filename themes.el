;;; global theme
(defun set-theme (theme)
  "Set theme to local buffer"
  (interactive "sTheme to load:")
  (color-theme-buffer-local
    (symbol-value theme)
    (current-buffer)))

(defcustom use-light-theme nil
  "Check to use the light theme"
  :group 'themes
  :type 'boolean
)

(use-package zenburn-theme
  :ensure t
  
)

(setq use-light-theme nil)

(defun reload-theme ()
  "Forces emacs to reload the configured theme"
  (interactive)
  (if 'use-light-theme
    (load-theme 'one-light t)
    (load-theme 'one-dark t)
  ))

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


;;; Fonts
(setq ia-writer-duospace "iA Writer Duospace")
(setq ia-writer-duo-v "iA Writer Duo V")
(setq ia-writer-mono-s "iA Writer Mono S")

(defun with-fixed-width-font (font-family-name)
  (face-remap-add-relative 'default :family font-family-name :height 100 :width 50))

(defun with-variable-width-font (font-family-name)
  (face-remap-add-relative 'default :family font-family-name :height 100 :width 'semi-condensed))

(defun with-ia-writer-duospace ()
  (interactive)
  (with-variable-width-font ia-writer-duospace))

(defun with-ia-writer-duo-variable ()
  (interactive)
  (with-variable-width-font ia-writer-duo-v))

(defun with-ia-writer-mono ()
  (interactive)
  (with-fixed-width-font ia-writer-mono-s))
  
(add-hook 'org-mode-hook 'with-ia-writer-duospace)
