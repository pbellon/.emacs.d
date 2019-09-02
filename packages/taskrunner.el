(quelpa
  '(emacs-taskrunner
    :fetcher github
    :repo "emacs-taskrunner/emacs-taskrunner"))

(use-package ivy-taskrunner
  :after (emacs-taskrunner)
  :quelpa 
  (ivy-taskrunner
    :fetcher github
    :repo "emacs-taskrunner/ivy-taskrunner"))
