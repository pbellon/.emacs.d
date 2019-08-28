(use-package cheat
  :quelpa (cheat :fetcher git :url "https://github.com/pbellon/cheat.git")
  :config
  (add-to-list 'cheat/sheets
               '(kbd "Custom Keyboard shortcuts" "~/.emacs/cheatsheets/kbd.org"))
  (cheat/init))
