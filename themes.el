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
  :quelpa (doom-modeline :fetcher github :repo "seagle0128/doom-modeline")
  :after (all-the-icons)
  :config
  (doom-modeline-mode 1))


;;; Fonts
(setq ia-writer-duospace "iA Writer Duospace")
(setq ia-writer-duo-v "iA Writer Duo V")
(setq ia-writer-mono-s "iA Writer Mono S")

(defun with-variable-width-font (font-family-name)
  (setq buffer-face-mode-face '(:family font-family-name :height 100 :width semi-condensed))
  (buffer-face-mode))

(defun with-ia-writer-duospace-variable ()
  (interactive)
  (with-variable-width-font ia-writer-duospace))

(defun with-ia-writer-duo-variable ()
  (interactive)
  (with-variable-width-font ia-writer-duo-v))

(defun with-ia-writer-mono ()
  (interactive)
  (with-fixed-width-font ia-writer-mono-s))
  
(add-hook 'org-mode-hook 'with-ia-writer-mono)
