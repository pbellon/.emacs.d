(defun trb--setup ()
  "Setup my custom cheats"
  (setq cheat/categories 
    '(
       "JavaScript"
       "Emacs"
       "Markup"
       "CLI"
       "Org"
       "HTML"
       "C-like"
       "Ruby"
       "Python"
       "LULZ"
       )
    )
  
  (add-to-list 'cheat/sheets-folders "~/.emacs.d/cheatsheets/")
  (cheat--setup)
)

(quelpa '(cheat :fetcher github :repo "pbellon/cheat")
  (require 'cheat)
  (add-hook 'after-init-hook #'trb--setup))

;; (require 'cheat)
;; (trb--setup)
;; (use-package cheat
;;   :quelpa (cheat :fetcher file :path "~/Dev/cheat/cheat.el")
;;   :config
;; )
