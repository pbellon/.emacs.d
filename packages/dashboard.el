(use-package dashboard
  :after (evil)
  :ensure t
  :config
  (setq initial-buffer-choice #'(lambda () (get-buffer "*dashboard*")))
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-items '((recents . 10)
                          (projects . 10)
                          (bookmarks . 4)))
  (dashboard-setup-startup-hook))
