(use-package ag :straight t)

(use-package projectile
  :config
  ;; Adds npm as a new project type
  (projectile-register-project-type 
   'npm 
   '("package.json")
   :compile "npm install"
   :test "npm test"
   :run "npm start"
   :test-suffix ".spec")

  (setq projectile-indexing-method 'alien)
  (setq projectile-project-search-path '("~/Dev" "~/notes" "~/.emacs.d"))
  (setq projectile-enable-caching t)
  (setq projectile-globally-ignored-directories
    (append 
      '(
         "elpa"
         "quelpa"
         "vendor"
         "vendor\-libs"
         "dist"
         "build"
         "build-prod"
         "build-static"
         "coverage"
         "node_modules"
         "build"
         "build-static"
         ".cache"
         )
      projectile-globally-ignored-directories)
    )
  
  (setq projectile-globally-ignored-files
        (append
          '("*.min.js"
             "deps.js"
             "*.orig"
             "*.pyc"
             "*.swo"
             "*.swp"
             "*.log"
             "*#"
             "*~"
             "*.swn")
          projectile-globally-ignored-file-suffixes))

  (define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)
)


(use-package counsel-projectile
  :straight t
  :after (counsel projectile)
  :config
  (counsel-projectile-mode 1)
)

