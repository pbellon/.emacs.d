;;; global theme
(defun reload-theme-with (use-light)
  (if (not (eq use-light nil))
    (load-theme 'one-light t)
    (load-theme 'one-dark t)
  ))

(defcustom use-light-theme nil
  "Check to use the light theme"
  :set (lambda (symbol value)
         (message "value changed %s %s" format value)
         (reload-theme-with (or value 0)))
  :type 'boolean
  :group 'themes
  :initialize 'custom-initialize-changed
)



(defun reload-theme ()
  "Forces emacs to reload the configured theme"
  (interactive)
  (reload-theme-with 'use-light-theme)
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
