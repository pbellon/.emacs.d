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
        (append '("vendor" "vendor\-libs" "dist" "coverage") projectile-globally-ignored-directories))
  
  (setq projectile-globally-ignored-files
        (append '("*.min.js"
                  "deps.js"
                  "*.orig"
                  "*.pyc"
                  "*.swo"
                  "*.swp"
                  "*.log"
                  "*#"
                  "*.swn") projectile-globally-ignored-file-suffixes))
  :init
  (projectile-mode 1)
  (define-key projectile-mode-map (kbd "M-p") 'projectile-command-map))
