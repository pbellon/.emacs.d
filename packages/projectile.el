(defun load-project-file-if-exists (fn)
  (let ((path (projectile-expand-root fn)))
    (message "going to load %s if exists" path)
    (if (file-exists-p path)
      (load-file path))))

(defun after-switch-project-hook-callback ()
  (message "hook callback called !")
  (load-project-file-if-exists "project.el"))

(use-package ag :ensure t)

(use-package projectile
  :ensure t
  :config
  ;; Adds npm as a new project type
  (projectile-register-project-type 
   'npm 
   '("package.json")
   :compile "npm install"
   :test "npm test"
   :run "npm start"
   :test-suffix ".spec")

  (setq projectile-project-search-path '("~/Dev"))
  (setq projectile-enable-caching t)
  (setq projectile-globally-ignored-directories
    (append 
      '(
         "vendor"
         "vendor\-libs"
         "dist"
         "coverage"
         "node_modules"
         ".cache"
         ) projectile-globally-ignored-directories)
    )
  
  (setq projectile-globally-ignored-files
        (append '("*.min.js"
                  "deps.js"
                  "*.orig"
                  "*.pyc"
                  "*.swo"
                  "*.swp"
                  "*.log"
                  "*#"
                  "*~"
                  "*.swn") projectile-globally-ignored-file-suffixes))
  (define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)
  :hook (projectile-after-switch-project . after-switch-project-hook-callback))


(use-package counsel-projectile
  :ensure t
  :after (counsel projectile)
  :config
  (counsel-projectile-mode 1)
)

