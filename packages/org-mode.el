(use-package htmlize
  :ensure t
  :after org
  :config
  ;; (setq org-html-htmlize-output-type 'inline-css) ;; default
  (setq org-html-htmlize-output-type 'css)
  ;; (setq org-html-htmlize-font-prefix "") ;; default
  (setq org-html-htmlize-font-prefix "org-")

  (progn
    ;; It is required to disable `fci-mode' when `htmlize-buffer' is called;
    ;; otherwise the invisible fci characters show up as funky looking
    ;; visible characters in the source code blocks in the html file.
    ;; http://lists.gnu.org/archive/html/emacs-orgmode/2014-09/msg00777.html
    (with-eval-after-load 'fill-column-indicator
      (defvar modi/htmlize-initial-fci-state nil
        "Variable to store the state of `fci-mode' when `htmlize-buffer' is called.")

      (defun modi/htmlize-before-hook-fci-disable ()
        (setq modi/htmlize-initial-fci-state fci-mode)
        (when fci-mode
          (fci-mode -1)))

      (defun modi/htmlize-after-hook-fci-enable-maybe ()
        (when modi/htmlize-initial-fci-state
          (fci-mode 1)))

      (add-hook 'htmlize-before-hook #'modi/htmlize-before-hook-fci-disable)
      (add-hook 'htmlize-after-hook #'modi/htmlize-after-hook-fci-enable-maybe)))
)

;; markdown export backend
(use-package ox-gfm
  :ensure t
  :after org)

;; asciidoc export backend
(use-package ox-asciidoc
  :ensure t
  :after org)

;; reveal.js export backend to give presentations with org
(use-package ox-reveal
  :after org
  :ensure t)


(setq org-publish-project-alist nil)
(load-file "~/notes/init.el")

(defun custom-org-keybindings ()
  "Setup custom keybindings for org-mode"
  (local-set-key (kbd "C-c L") #'org-toggle-link-display)
  (local-set-key (kbd "C-c i") (lambda () (org-display-inline-images t t)))
)

;; customization of org behavior
(with-eval-after-load 'org
  (setq org-src-fontify-natively t)
  (setq org-html-doctype "html5")
  (add-hook 'org-mode-hook #'custom-org-keybindings)
  (add-hook 'org-mode-hook #'visual-line-mode)
  (setq org-todo-keywords
    '((sequence "TODO" "BUG" "NOW" "LATER" "CHECK" "|" "DONE" "CANCELED")))
  (setq org-log-done 'time)
  ;; don't ask to evaluate source code block 
  (setq org-confirm-babel-evaluate nil)
  ;; activate shell language for babel
  (org-babel-do-load-languages 'org-babel-load-languages
    '((shell t))
  )
)
