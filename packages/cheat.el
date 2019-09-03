(use-package cheat
  :ensure t
  :config
  (add-to-list 'cheat/sheets-folders "~/.emacs.d/cheatsheets")
  (cheat/reload-sheets)
  (cheat--macro)
)
