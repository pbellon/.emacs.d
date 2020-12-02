(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
          (exec-path-from-shell-initialize))
)

(defun eslint-fix ()
  (interactive)
  (shell-command
    (concat "yarn eslint --fix "
      (buffer-file-name (current-buffer)))))

(defun typecheck ()
  (interactive)
  (shell-command
    (concat "yarn typecheck "
      (buffer-file-name (current-buffer)))))

(defun use-exec-from-node-modules (exec-name)
  "Returns path to local node_modules executable"
  (let*
    ((root (locate-dominating-file
             (or (buffer-file-name) default-directory)
             "node_modules"))
     (executable
       (and root
         (expand-file-name
           (concat "node_modules/.bin/" exec-name)
           root))))
    (if (and executable (file-executable-p executable))
      executable
      nil)))

(defun use-eslint-from-node-modules ()
  (let* ((eslint (use-exec-from-node-modules "eslint")))
    (when eslint
      (setq-local flycheck-javascript-eslint-executable eslint)
      (flycheck-select-checker 'javascript-eslint))))

(defun use-prettier-from-node-modules ()
  (let* ((prettier (use-exec-from-node-modules "prettier")))
    (when prettier
      (setq-local prettier-js-command prettier))))

(use-package add-node-modules-path
  :ensure t)

(use-package prettier-js
  :ensure t
  :config
  (add-hook 'js2-mode-hook #'prettier-js-mode)
  (add-hook 'web-mode-hook #'prettier-js-mode)
  (add-hook 'typescript-mode-hook #'prettier-js-mode)
  (add-hook 'prettier-js-mode-hook #'use-prettier-from-node-modules)
  )


(use-package flycheck
  :ensure t
  :config
  (setq-default flycheck-disabled-checkers
    (append flycheck-disabled-checkers
      '(javascript-jshint)))
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-add-mode 'javascript-eslint 'typescript-mode)
  (setq-default flycheck-temp-prefix ".flycheck")
  (add-hook 'flycheck-mode-hook #'use-eslint-from-node-modules)
)

(use-package company
  :ensure t
)

(use-package company-box
  :ensure t
  :after company
  :hook (company-mode . company-box-mode))

(use-package typescript-mode
  :ensure t
  :mode "\\.ts\\'")

(use-package web-mode
  :ensure t
  :mode "\\.tsx\\'")

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook ((typescript-mode . lsp-deferred)
         (web-mode . lsp-deferred))
  :config
  (setq-default
    lsp-keymap-prefix "C-c"
    lsp-prefer-flymake nil
    lsp-auto-guess-root t
    lsp-vetur-format-default-formatter-ts "none"
    lsp-vetur-format-default-formatter-html "none"
    lsp-vetur-format-default-formatter-css "none"
    )
  ;; Disable formatting (prettier used instead)
  (bind-key* "<f12>" #'lsp-ui-peek-find-definitions lsp-mode-map))

(use-package lsp-ui
  :ensure t
  :init
  (setq-default lsp-ui-flycheck-enable t)
  :hook ((lsp-mode . flycheck-mode)
         (lsp-mode . lsp-ui-mode))
  :config
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (lsp-treemacs-sync-mode 1)
  (lsp-ui-doc-mode 0)
  (bind-key "M-U" #'lsp-ui-peek-find-references lsp-mode-map)
  (bind-key "<escape>" #'lsp-ui-doc--hide-frame lsp-ui-doc-mode))


;; Java
(use-package lsp-java
  :after lsp-mode
  :ensure t 
  :hook ((java-mode . lsp))
)

(use-package dap-mode
  :after lsp-mode
  :ensure t
  :config (dap-auto-configure-mode)
)

(use-package dap-java)
