(use-package swiper
  :ensure t)

(use-package ivy
  :ensure t
  :after (swiper counsel)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  ;; enable this if you want `swiper' to use it
  ;; (setq search-default-mode #'char-fold-to-regexp)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "<f6>") 'ivy-resume)
  (ivy-mode 1))

(use-package swiper
  :ensure t
  :after ivy
  :config
  (global-set-key "\M-s" 'swiper))

(use-package counsel
  :after (ivy swiper)
  :ensure t
  :config
  ;; ignore buffer files
  (setq counsel-find-file-ignore-regexp "\\.elc\\'|*~\\'")
  (global-set-key (kbd "<f6>") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
  (global-set-key (kbd "C-x C-b") 'counsel-ibuffer)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

  (add-to-list 'ivy-initial-inputs-alist '(counsel-M-x . "")) ;; for
)
