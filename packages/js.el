(use-package typescript-mode
  :ensure t
)

(use-package company
  :ensure t
  :config
  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t))

(defun split-and-jump-to-definition()
  "Split frame and jump to definition"
  (interactive)
  (split-window-below)
  (balance-windows)
  (tide-jump-to-definition))

(defun split-and-jump-to-implementation()
  "Split frame and jump to implementation"
  (interactive)
  (split-window-below)
  (balance-windows)
  (tide-jump-to-implementation))

(defun setup-tide-mode()
  (interactive)
  (editorconfig-apply)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency.You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

(use-package tide
 :init
 :ensure t
 :after (typescript-mode company flycheck)
 :hook ((typescript-mode . setup-tide-mode)
        (typescript-mode . editorconfig-apply))
 :config
 
 (global-set-key (kbd "M->") 'split-and-jump-to-definition)
 (global-set-key (kbd "M-?") 'split-and-jump-to-implementation)

 (global-set-key (kbd "M-.") 'tide-jump-to-definition)
 (global-set-key (kbd "M-/") 'tide-jump-to-implementation))



(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx$" . web-mode))
)

(defun eslint-formatter (&optional b e)
      "formats the selected text to format the js"
    (interactive "r")
    (call-process-region (point-max) (point-min) "eslint_d" t t nil "--stdin" "--fix-to-stdout"))

(use-package js2-mode
  :after (flycheck)
  :ensure t
  :config
  (add-hook 'js2-mode-hook #'flycheck-mode)
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
)
