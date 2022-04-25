(use-package dashboard
  :after (evil)
  :ensure t
  :config
  (setq initial-buffer-choice #'(lambda () (get-buffer "*dashboard*")))
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-items '((recents . 10)
                          (projects . 10)
                          (bookmarks . 4)))
  (dashboard-setup-startup-hook))


(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "C-x C-w") 'ace-window))


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

(global-set-key (kbd "C-x B") 'ibuffer)


(use-package imenu-list
  :ensure t
  :config
  (global-set-key (kbd "C-{") #'imenu-list-smart-toggle)
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


(use-package minions
  :ensure t
  :init (minions-mode)
  :config
  (display-time-mode +1)
  (setq minions-mode-line-lighter "#")
  (setq minions-direct '(flycheck-mode)))


(use-package emojify
  :ensure t
  :hook (after-init . global-emojify-mode))
