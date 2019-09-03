(use-package dashboard
  :after (evil)
  :ensure t
  :init
  (setq initial-buffer-choice #'(lambda () (get-buffer "*dashboard*")))
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-items '((recents . 10)
                          (projects . 10)))
  :config
  (dashboard-setup-startup-hook))
