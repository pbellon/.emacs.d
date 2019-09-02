(use-package taskrunner
  :quelpa 
  (taskrunner :fetcher git :url "https://github.com/emacs-taskrunner/emacs-taskrunner.git")
  :ensure t
)


(use-package ivy-taskrunner
  :after (taskrunner ivy swiper)
  :quelpa
  (ivy-taskrunner :fetcher git :url "https://github.com/emacs-taskrunner/ivy-taskrunner.git")
  :ensure t)
