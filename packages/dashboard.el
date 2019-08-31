(use-package dashboard
  :after (evil)
  :ensure t
  :init
  (setq initial-buffer-choice #'(lambda () (get-buffer "*dashboard*")))
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-items '((recents . 5)
                          (projects . 5)
                          (bookmarks . 5)))
  :config
  (dashboard-setup-startup-hook))
