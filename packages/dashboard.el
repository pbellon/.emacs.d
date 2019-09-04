(use-package dashboard
  :after (evil)
  :ensure t
  :init
  (setq initial-buffer-choice #'(lambda () (get-buffer "*dashboard*")))
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-items '((recents . 9)
                          (projects . 9)
                          (bookmarks . 4)))

  :config
  (dashboard-setup-startup-hook))
