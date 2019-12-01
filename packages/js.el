(use-package typescript-mode
  :ensure t
  )

(defun use-eslintd ()
  (let* ((eslintd "/usr/bin/eslint_d"))
    (when (and eslintd (file-executable-p eslintd))
      (setq-local flycheck-javascript-eslint-executable eslintd)
      (flycheck-select-checker 'javascript-eslint)
    )))

(defun use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                 (or (buffer-file-name) default-directory)
                 "node_modules"))
          (eslint (and root
                    (expand-file-name "node_modules/.bin/eslint"
                      root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint)
      (flycheck-select-checker 'javascript-eslint)
      )))

(defun use-prettier-from-node-modules ()
  (let* ((root (locate-dominating-file
                 (or (buffer-file-name) default-directory)
                 "node_modules"))
          (prettier (and root
                      (expand-file-name "node_modules/.bin/prettier"
                        root))))
    (when (and prettier (file-executable-p prettier))
      (setq-local prettier-js-command prettier))))

(use-package flycheck
  :ensure t
  :config
  (setq-default flycheck-disabled-checkers
    (append flycheck-disabled-checkers
      '(javascript-jshint)))

  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-add-mode 'javascript-eslint 'typescript-mode)
  (setq-default flycheck-temp-prefix ".flycheck")
  ;; (add-hook 'flycheck-mode-hook #'use-eslintd)
  (add-hook 'flycheck-mode-hook #'use-eslint-from-node-modules)
  )


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
  (company-mode +1)
  )

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :config
  ;; (global-set-key (kbd "M->") 'split-and-jump-to-definition)
  (global-set-key (kbd "M->") 'tide-jump-to-definition)
  (global-set-key (kbd "M-/") 'tide-jump-to-implementation)

  (add-hook 'typescript-mode-hook #'setup-tide-mode)
  (add-hook 'web-mode-hook #'setup-tide-mode)
  )

(use-package prettier-js
  :ensure t
  :config
  (add-hook 'js2-mode-hook #'prettier-js-mode)
  (add-hook 'web-mode-hook #'prettier-js-mode)
  (add-hook 'typescript-mode-hook #'prettier-js-mode)
  (add-hook 'prettier-js-mode-hook #'use-prettier-from-node-modules)
  )

(use-package eslintd-fix
  :ensure t
  :config
  (add-hook 'js2-mode-hook 'eslintd-fix-mode)
  (add-hook 'web-mode-hook 'eslintd-fix-mode)
  (add-hook 'typescript-mode-hook 'eslintd-fix-mode)
  )


(use-package web-mode
  :ensure t
  :config
  (setq web-mode-enable-auto-quoting nil)
  (setq web-mode-enable-comment-annotation t)
  (add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx$" . web-mode))

  (add-hook 'web-mode-hook
    (lambda ()
      (when (string-equal "tsx" (file-name-extension buffer-file-name))
        (setup-tide-mode))))
  )

;; (use-package lsp-mode
;;   :ensure t
;;   :hook 
;;   (
;;     (web-mode . lsp)
;;     (typescript-mode . lsp)
;;     (js2-mode . lsp)
;;   )
;;   :commands lsp)

(use-package js2-mode
  :after (flycheck)
  :ensure t
  :config
  (add-hook 'js2-mode-hook #'flycheck-mode)
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

  )
