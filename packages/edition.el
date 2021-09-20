(use-package typescript-mode
  :ensure t
  :mode "\\.ts\\'")

(use-package web-mode
  :ensure t
  :mode "\\.tsx\\'")

;; Graphviz
(use-package graphviz-dot-mode
  :ensure t
  :config
  (setq graphviz-dot-indent-width 4))


(defun adoc/html ()
  "Generate the current asciidoc file with asciidoc"
  (interactive)
  (let ((fname (buffer-file-name)))
   (let ((cmd
          (concat 
           "source ~/opt/shell/setup.sh && activate-ruby-if-needed && bundle exec asciidoctor -b html5 " 
           fname)))
     (message (concat "Running command: " cmd))
     (message (shell-command-to-string cmd))
     (browse-url-xdg-open
      (concat
       "file:///"
       (file-name-sans-extension fname)
       ".html"))
   )
  )
)

(defun adoc/pdf ()
  "Generate the current asciidoc file with asciidoc"
  (interactive)
  (let ((fname (buffer-file-name)))
   (let ((cmd
          (concat 
           "source ~/opt/shell/setup.sh && activate-ruby-if-needed && bundle exec asciidoctor-pdf " 
           fname)))
     (message (concat "Running command: " cmd))
     (message (shell-command-to-string cmd))
     (browse-url-xdg-open
      (concat
       "file:///"
       (file-name-sans-extension fname)
       ".pdf"))
   )
  )
)

;; markup languages

;; asciidoc
(use-package adoc-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist (cons "\\.txt\\'" 'adoc-mode))
  (add-to-list 'auto-mode-alist (cons "\\.adoc\\'" 'adoc-mode))
  (add-hook 'adoc-mode-hook (lambda () (buffer-face-mode t))))

;; markdown
(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode))
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))

(use-package ob-mermaid
  :ensure t
  :config
  (setq ob-mermaid-cli-path "/usr/local/bin/mmdc"))



(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

;; plantuml
(use-package plantuml-mode
  :after org
  :ensure t
  :config
  (global-unset-key (kbd "C-x C-u"))
  (global-set-key (kbd "C-x C-u C-c") '(lambda () (interactive) (plantuml-preview 4)))
  (setq plantuml-jar-path "~/opt/plantuml.jar")
  (setq org-plantuml-jar-path plantuml-jar-path)
  (add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
  (add-to-list 'auto-mode-alist '("\\.puml\\'" . plantuml-mode))
  (add-to-list 'auto-mode-alist '("\\.uml\\'" . plantuml-mode))
  (org-babel-do-load-languages 'org-babel-load-languages
			       '((plantuml . t))))

(use-package elpy
  :after company
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))


;; FIXME mode
(use-package fic-mode
  :ensure t
  :hook ((prog-mode . fic-mode)
         (web-mode . fic-mode))
)


(use-package fish-mode
  :ensure t)


;; Folding behavior 
(add-hook 'prog-mode-hook #'hs-minor-mode)

(eval-after-load 'hideshow
  '(progn
     (global-set-key (kbd "C-c C-f") 'hs-toggle-hiding)))

(use-package fold-dwim
  :ensure t
  :config
)

(use-package display-line-numbers
  :config
  (add-hook 'prog-mode-hook #'display-line-numbers-mode))


(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line.

Move point to the first non-whitespace character on this line.
If point was already at that position, move point to beginning of line."
  (interactive "^") ; Use (interactive) in Emacs 22 or older
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))

(global-set-key [home] 'smart-beginning-of-line)
