(require 'cheat)
(setq cheat/categories '(
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
))
                        
(add-to-list 'cheat/sheets-folders "~/.emacs.d/cheatsheets/")
(cheat/setup)
