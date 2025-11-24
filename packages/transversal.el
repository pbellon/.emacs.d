;; ssh env etc.
(use-package keychain-environment
  :ensure t
  :config
  (keychain-refresh-environment))

(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "C-x o") 'ace-window))

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
  (ivy-mode 1)
)

(use-package swiper
  :ensure t
  :after ivy
  :config
  (global-set-key "\C-s" 'swiper))

(use-package counsel
  :ensure t
  :after (ivy swiper)
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
  (global-set-key (kbd "C-x B") 'ibuffer)
  (global-set-key (kbd "C-x C-b") 'counsel-ibuffer)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
  (add-to-list 'ivy-initial-inputs-alist '(counsel-M-x . "")) ;; for
)


(use-package imenu-list
  :ensure t
  :config
  (global-set-key (kbd "C-c C-m") #'imenu-list-smart-toggle)
  (setq imenu-list-auto-resize t)
  (setq imenu-list-position 'right))


;; Configure browsing from & inside emacs

(defun browse-url-firefox (url &optional new-window)
  "Ask the Firefox WWW browser to load URL.
  Default to the URL around or before point.  The strings in
  variable `browse-url-firefox-arguments' are also passed to
  Firefox.
  
  When called interactively, if variable
  `browse-url-new-window-flag' is non-nil, load the document in a
  new Firefox window, otherwise use a random existing one.  A
  non-nil interactive prefix argument reverses the effect of
  `browse-url-new-window-flag'.
  
  If `browse-url-firefox-new-window-is-tab' is non-nil, then
  whenever a document would otherwise be loaded in a new window, it
  is loaded in a new tab in an existing window instead.
  
  When called non-interactively, optional second argument
  NEW-WINDOW is used instead of `browse-url-new-window-flag'."
  (interactive (browse-url-interactive-arg "URL: "))
  (setq url (browse-url-encode-url url))
  (let* ((process-environment (browse-url-process-environment))
          (window-args (if (browse-url-maybe-new-window new-window)
                          (if browse-url-firefox-new-window-is-tab
                              '("-new-tab")
                            '("-new-window"))))
          (ff-args (append browse-url-firefox-arguments window-args (list url)))
          (process-name (concat "firefox " url))
          (process (apply 'start-process process-name nil
                          browse-url-firefox-program ff-args) )) ))


(setq browse-url-browser-function 'browse-url-firefox
      browser-url-generic-program "firefox")

;; Fixes xdg-open issue on org HTML export which can't open the resulting html 
;; file (C-c- C-e h o)
(setq process-connection-type nil)

(use-package magit
  :ensure t
  :bind (("C-x g" . 'magit-status))
  :config
  (setq vc-handled-backends (delq 'Git vc-handled-backends))
)

(use-package ssh-agency :ensure t)

;; change split orientation
(use-package transpose-frame
  :ensure t
  :bind (("C-x t w" . 'transpose-frame)))

