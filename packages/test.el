(load-file "./manager.el")
(setq debug-on-error t)
(with-eval-after-load "manager"
  (setq manager/dependencies-config-dir "~/.emacs.d/packages/test")
  (setq manager/dependencies-config-file "~/.emacs.d/packages/test.el")
  (setq manager/dependencies
    '(
        "first"
        "second"
        "third"
      )
    )
  (manager/setup))
(require 'manager)
