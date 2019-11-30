(use-package elpy
  :after company
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))
