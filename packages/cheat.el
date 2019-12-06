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

    (add-to-list 'cheat/sheets-folders "~/Dev/cheatsheets/")
    (add-to-list 'cheat/sheets-folders "~/.emacs.d/cheatsheets/")
    (add-hook 'after-init-hook #'cheat--setup)
)

;; (require 'cheat)
;; (trb--setup)
;; (use-package cheat
;;   :quelpa (cheat :fetcher file :path "~/Dev/cheat/cheat.el")
;;   :config
;; )
