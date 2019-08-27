(use-package cheat
  :load-path "~/Dev/cheat/"
  :config
  (add-to-list 'cheat/sheets
               '(kbd "Custom Keyboard shortcuts" "~/.emacs/cheatsheets/kbd.org"))
  (cheat/init))
