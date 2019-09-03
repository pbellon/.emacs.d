(use-package taskrunner
  :quelpa 
  (taskrunner :fetcher github :url "emacs-taskrunner/emacs-taskrunner")
  :ensure t
)

(use-package ivy-taskrunner
  :after (taskrunner ivy swiper)
  :quelpa 
  (ivy-taskrunner
    :fetcher github
    :repo "emacs-taskrunner/ivy-taskrunner")
  :ensure t
  )
