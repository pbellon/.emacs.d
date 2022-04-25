(use-package htmlize
  :straight t
  :after org
  :config
  ;; (setq org-html-htmlize-output-type 'inline-css) ;; default
  (setq org-html-htmlize-output-type 'css)
  ;; (setq org-html-htmlize-font-prefix "") ;; default
  (setq org-html-htmlize-font-prefix "org-")
)

;; Jira export backend
(use-package ox-jira
  :straight t
  :after org)

;; markdown export backend
(use-package ox-gfm
  :straight t
  :after org)

;; asciidoc export backend
(use-package ox-asciidoc
  :straight t
  :after org)

;; reveal.js export backend to give presentations with org
(use-package ox-reveal
  :after org
  :straight t)

(use-package org-projectile
  :bind (("C-c n p" . org-projectile-project-todo-completing-read)
         ("C-c c" . org-capture))
  :config
  (progn
    (org-projectile-per-project)
    (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
    (push (org-projectile-project-todo-entry) org-capture-templates))
  :straight t)

(setq org-publish-project-alist nil)

(defun org-refresh ()
  "Refresh parsed tree for current buffer"
  (interactive)
  (org-set-regexps-and-options))

(defun fixed-font-on-needing-blocks ()
  (set-face-attribute 'org-table nil :inherit 'fixed-pitch))


;;; took from https://stackoverflow.com/questions/25930097/emacs-org-mode-quickly-mark-todo-as-done/25942392#25942392
(defun org-set-to-done ()
  (interactive)
  (save-excursion
    (org-back-to-heading t) ;; Make sure command works even if point is
                            ;; below target heading
    (cond ((looking-at "\*+ TODO")
           (org-todo "DONE")
           (hide-subtree))
          ((looking-at "\*+ DONE")
           (org-todo "TODO")
           (hide-subtree))
          (t (message "Can only toggle between TODO and DONE.")))))

(defun get-org-keywords ()
  "Parse the buffer and return a cons list of (property . value)"
  (org-element-map (org-element-parse-buffer 'element) 'keyword
    (lambda (keyword) (cons
                        (org-element-property :key keyword)
                        (org-element-property :value keyword)))))
  
(defun get-org-keyword (key &optional kwds)
  "return the value associated to key"
  (unless kwds (setq kwds (get-org-keywords)))
  (cdr (assoc key props)))

;; customization of org behavior
(with-eval-after-load 'org
  (setq org-src-fontify-natively t)
  (setq org-html-doctype "html5")
  (setq org-image-actual-width 400)

  (customize-set-value 'org-latex-with-hyperref nil)
  (add-to-list 'org-latex-default-packages-alist "\\PassOptionsToPackage{hyphens}{url}")
  (add-hook 'org-mode-hook #'visual-line-mode)
  (add-hook 'org-mode-hook #'fixed-font-on-needing-blocks)
  (setq org-todo-keywords
    '((sequence "TODO(t)" "NOW(n)" "LATER(l)" "REVIEW(r)" "|" "INREVIEW(ir)" "WAITING" "DONE(D)" "CANCELED(c)" "DELEGATED(d)")))
  ;; don't ask to evaluate source code block 
  (setq org-confirm-babel-evaluate nil)
  ;; activate shell language for babel
  (org-babel-do-load-languages 'org-babel-load-languages
    '((shell t)))

  ;; Keybindings 
  (define-key org-mode-map (kbd "C-c L") #'org-toggle-link-display)
  (define-key org-mode-map (kbd "C-c i") (lambda () (org-display-inline-images t t)))
  (define-key org-mode-map (kbd "C-c D") 'org-set-to-done)
)
