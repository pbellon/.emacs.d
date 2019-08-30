(use-package dashboard
  :ensure t
  :init
  (setq dashboard-startup-banner 'logo)
  :config
  (dashboard-setup-startup-hook))
