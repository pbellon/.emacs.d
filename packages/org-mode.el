(use-package htmlize
  :ensure t
  :after org
  :config
  ;; (setq org-html-htmlize-output-type 'inline-css) ;; default
  (setq org-html-htmlize-output-type 'css)
  ;; (setq org-html-htmlize-font-prefix "") ;; default
  (setq org-html-htmlize-font-prefix "org-")
)

;; markdown export backend
(use-package ox-gfm
  :ensure t
  :after org)

;; asciidoc export backend
(use-package ox-asciidoc
  :ensure t
  :after org)

;; customization of org behavior
(with-eval-after-load 'org
  (setq org-src-fontify-natively t)
  (setq org-html-doctype "html5")
  (add-hook 'org-mode-hook #'visual-line-mode)
  (setq org-todo-keywords
    '((sequence "TODO" "BUG" "NOW" "LATER" "CHECK" "|" "DONE" "CANCELED")))
  (setq org-log-done 'time)

  ;; activate shell language for babel
  (org-babel-do-load-languages 'org-babel-load-languages
    '((shell t))
  )
)
