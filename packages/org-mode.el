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

;; (use-package flyspell
;;   :ensure t
;;   :config
;;   (setq org-dictionnaries 
;;     '(
;;        ("fr" . "francais")
;;        ("en" . "english")
;;      )
;;   )
 
;;   (defun configure-flyspell-for-org ()
;;     (flyspell-mode 1)
;;     (let* ((props (get-org-keywords)))
;;       (let* ((lang (get-org-keyword "LANGUAGE" props)))
;;         (ispell-change-dictionary (cdr (assoc lang org-dictionnaries)))))
;;   )
;;   (add-hook 'org-mode-hook #'configure-flyspell-for-org))

;; customization of org behavior
(with-eval-after-load 'org
  (setq org-src-fontify-natively t)
  (setq org-html-doctype "html5")
  (add-hook 'org-mode-hook #'custom-org-keybindings)
  (add-hook 'org-mode-hook #'visual-line-mode)
  (add-hook 'org-mode-hook #'fixed-font-on-needing-blocks)
  (setq org-todo-keywords
    '((sequence "TODO(t)" "NOW(n@/!)" "LATER" "REVIEW" "|" "INREVIEW" "DONE(D!)" "CANCELED(c@)" "DELEGATED(d)")))
  ;; don't ask to evaluate source code block 
  (setq org-confirm-babel-evaluate nil)
  ;; activate shell language for babel
  (org-babel-do-load-languages 'org-babel-load-languages
    '((shell t))
  )
  
  (define-key org-mode-map (kbd "C-c D") 'org-set-to-done)
)
