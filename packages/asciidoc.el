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

(use-package adoc-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist (cons "\\.txt\\'" 'adoc-mode))
  (add-to-list 'auto-mode-alist (cons "\\.adoc\\'" 'adoc-mode))
  (add-hook 'adoc-mode-hook (lambda () (buffer-face-mode t))))

