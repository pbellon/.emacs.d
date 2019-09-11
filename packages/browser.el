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
