(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (global-set-key (kbd "<C-tab>") 'company-indent-or-complete-common)
  (setq company-tooltip-align-annotations t)
)

;; (use-package company-quickhelp
;;   :after company
;;   :ensure t
;;   :hook (company-mode . company-quickhelp-mode)
;;   :config
;;   (define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin)
;; )

(use-package company-box
  :ensure t
  :after company
  :hook (company-mode . company-box-mode))
