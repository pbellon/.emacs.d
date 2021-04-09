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
  (add-hook 'css-mode-hook #'prettier-js-mode)
  (add-hook 'typescript-mode-hook #'prettier-js-mode)
  (add-hook 'prettier-js-mode-hook #'use-prettier-from-node-modules))


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

(use-package xref :ensure t)

(use-package eglot
  :after (add-node-modules-path xref)
  :ensure t
  :config
  (setq eglot-autoreconnect nil)
  (setq eglot-autoshutdown t)
  (setq eglot-confirm-server-initiated-edits nil)
  (setq eglot-events-buffer-size 0)

  (add-to-list 'eglot-server-programs '(web-mode . ("typescript-language-server" "--stdio")))
  (add-to-list 'eglot-server-programs '(typescript-mode . ("typescript-language-server" "--stdio")))

  (add-hook 'web-mode-hook 'eglot-ensure)
  (add-hook 'typescript-mode-hook 'eglot-ensure)

  :bind 
  (
    ("C-x C-r" . eglot-rename)
    ("<f12>" . xref-find-definitions)
  )
)


(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (global-set-key (kbd "<C-tab>") 'completion-at-point)
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
