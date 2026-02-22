;;; setup.el --- Main configuration file -*- lexical-binding: t; -*-

;;;; --- Init ------------------------------------------------------------------
(defconst trb/setup-start-time (current-time))

;; setting coding-system
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

;; set to nil to convert DOS EOL to UNIX on save
(setq inhibit-eol-conversion 1)

;; Start server after startup to avoid delaying init
(add-hook 'emacs-startup-hook
          (lambda ()
            (unless (and (boundp 'server-process) server-process)
              (server-start))))


;;;; --- Custom variables ------------------------------------------------------

(defvar user-emacs-config-file "~/.emacs.d/init.el")
(defvar user-emacs-config-dir "~/.emacs.d/")

;;;; --- Custom functions ------------------------------------------------------

(defun trb/reload-emacs-config ()
  "Reload init.el"
  (interactive)
  (load-file user-emacs-config-file))

(defun trb/sync-selected-packages ()
  "Derive package-selected-packages from use-package declarations in setup.el.
Writes the result back to custom-file (init.el) via `customize-save-variable'."
  (interactive)
  (let (pkgs)
    (with-temp-buffer
      (insert-file-contents (expand-file-name "setup.el" user-emacs-directory))
      (goto-char (point-min))
      (while (re-search-forward "^(use-package \\([^ \n]+\\)" nil t)
        (push (intern (match-string 1)) pkgs)))
    (setq pkgs (delete-dups (nreverse pkgs)))
    (customize-save-variable 'package-selected-packages pkgs)
    (message "[trb] package-selected-packages updated: %s"
             (mapconcat #'symbol-name pkgs " "))))

(defun trb/clean-packages ()
  "Sync package-selected-packages from setup.el, then remove orphan packages."
  (interactive)
  (trb/sync-selected-packages)
  (package-autoremove))


(defun trb/open-emacs-config ()
  (interactive)
  (switch-to-buffer
   (find-file-noselect user-emacs-config-dir)))

;;  Took from https://www.emacswiki.org/emacs/MoveLine
(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

(defun trb/remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(defun trb/switch-to-minibuffer ()
  "Switch to minibuffer window."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))
    (error "Minibuffer is not active")))

; Source - https://stackoverflow.com/a/7250027
; Posted by amalloy
; Retrieved 2026-02-22, License - CC BY-SA 3.0
(defun trb/smart-beginning-of-line ()
  "Move point to the beginning of text on the current line; if that is already
the current position of point, then move it to the beginning of the line."
  (interactive)
  (let ((pt (point)))
    (beginning-of-line-text)
    (when (eq pt (point))
      (beginning-of-line))))


;;;; --- Global keybindings ----------------------------------------------------

;; window size management
(global-set-key (kbd "C-c C-w C-p") 'shrink-window-horizontally)
(global-set-key (kbd "C-*") 'enlarge-window-horizontally)
(global-set-key (kbd "C--") 'shrink-window)
(global-set-key (kbd "C-+") 'enlarge-window)

;; maximize current window
(global-set-key (kbd "C-=") 'maximize-window)
(global-set-key (kbd "C-\\") 'minimize-window)
(define-key ctl-x-4-map "t" 'toggle-window-split)


;; execute expression (under pointer)
(define-key emacs-lisp-mode-map (kbd "C-c C-e") 'eval-last-sexp)
(define-key emacs-lisp-mode-map (kbd "C-c C-r") 'eval-region)
(define-key emacs-lisp-mode-map (kbd "C-c C-b") 'eval-buffer)

;; ALT+F4 binding, also bound to C-x C-c
(global-set-key (kbd "M-<f4>") 'save-buffers-kill-terminal) 

;; general trb/edition keybindings
(global-set-key (kbd "<f5>") 'sort-lines)
(global-set-key (kbd "C-c C-/") #'comment-or-uncomment-region)
(global-set-key (kbd "M-<up>") #'move-line-up)
(global-set-key (kbd "M-<down>") #'move-line-down)

(global-set-key (kbd "C-c C-c b") #'trb/switch-to-minibuffer)
(global-set-key (kbd "C-x C-/") #'revert-buffer)
(global-set-key (kbd "C-x C-b")  #'switch-to-buffer)

;; Defines list of kbd translations for special unicode chars.
(define-key key-translation-map (kbd "<f9> p") (kbd "φ"))
(define-key key-translation-map (kbd "<f9> d") (kbd "Δ"))

;; go to start of line
(global-set-key [home] 'trb/smart-beginning-of-line)
(global-set-key (kbd "C-a") #'trb/smart-beginning-of-line)



;;;; --- Setup use-package & external deps tools -------------------------------
(package-initialize)

;; Package archives — modern Emacs has built-in TLS support, no SSL detection needed
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t 
        use-package-expand-minimally t))


;;;; --- Contextual configurations ---------------------------------------------
;;;; --- Edition  --------------------------------------------------------------
(add-hook 'prog-mode-hook #'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook #'show-paren-mode)

(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)
(column-number-mode t)
(electric-indent-mode -1)
;; trust all themes without prompting
(setq custom-safe-themes t)

(use-package markdown-mode
  :mode (".md" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
              ("C-c C-d" . markdown-do)
              ("C-c C-x <up>" . markdown-table-delete-row)
              ("C-c C-x <down>" . markdown-table-insert-row)))

(eval-after-load 'hideshow
  '(progn
     (global-set-key (kbd "C-c C-f") 'hs-toggle-hiding)))


(use-package htmlize
  :after org
  :config
  ;; (setq org-html-htmlize-output-type 'inline-css) ;; default
  (setq org-html-htmlize-output-type 'css)
  ;; (setq org-html-htmlize-font-prefix "") ;; default
  (setq org-html-htmlize-font-prefix "org-"))

;; markdown export backend
(use-package ox-gfm
  :after org)

(defun org-refresh ()
  "Refresh parsed tree for current buffer."
  (interactive)
  (org-set-regexps-and-options))

(defun fixed-font-on-needing-blocks ()
  (set-face-attribute 'org-table nil :inherit 'fixed-pitch))

;; took from https://stackoverflow.com/questions/25930097/emacs-org-mode-quickly-mark-todo-as-done/25942392#25942392
(defun org-set-to-done ()
  (interactive)
  (save-excursion
    (org-back-to-heading t) ;; Make sure command works even if point is
                            ;; below target heading
    (cond ((looking-at "\*+ TODO")
           (org-todo "DONE")
           (hide-subtree))
          ((looking-at "\*+ DONE")
           (org-todo "TODO")
           (hide-subtree))
          (t (message "Can only toggle between TODO and DONE.")))))

(defun get-org-keywords ()
  "Parse the buffer and return a cons list of (property . value)."
  (org-element-map (org-element-parse-buffer 'element) 'keyword
    (lambda (keyword) (cons (org-element-property :key keyword)
                            (org-element-property :value keyword)))))

(defun get-org-keyword (key &optional kwds)
  "Return the value associated to KEY."
  (unless kwds (setq kwds (get-org-keywords)))
  (cdr (assoc key kwds)))

(use-package org
  :ensure nil  ;; built-in
  :defer t
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         :map org-mode-map
         ("C-c L" . org-toggle-link-display)
         ("C-c i" . (lambda () (interactive) (org-display-inline-images t t)))
         ("C-c D" . org-set-to-done))
  :hook ((org-mode . visual-line-mode)
         (org-mode . fixed-font-on-needing-blocks))
  :config
  (setq org-src-fontify-natively    t
        org-html-doctype            "html5"
        org-image-actual-width      400
        org-support-shift-select    'always
        org-confirm-babel-evaluate  nil
        org-publish-project-alist   nil
        org-todo-keywords           '((sequence "TODO(t)" "NOW(n)" "LATER(l)" "REVIEW(r)"
                                                "|" "INREVIEW(ir)" "WAITING"
                                                "DONE(D)" "CANCELED(c)" "DELEGATED(d)")))
  (customize-set-value 'org-latex-with-hyperref nil)
  (add-to-list 'org-latex-default-packages-alist "\\PassOptionsToPackage{hyphens}{url}")
  (org-babel-do-load-languages 'org-babel-load-languages '((shell . t))))


;;;; --- Transversal -----------------------------------------------------------

;; ssh env — deferred, not needed before first connection
(use-package keychain-environment
  :defer 2
  :config
  (keychain-refresh-environment))

(use-package ace-window
  :bind ("C-x o" . ace-window))

;; ivy is the foundation — no :after, must initialize at startup
(use-package ivy
  :demand t
  :bind (("C-c C-r" . ivy-resume)
         ("<f6>"   . ivy-resume))
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (ivy-mode 1))

(use-package swiper
  :after ivy
  :bind ("C-s" . swiper))

;; Fixes xdg-open issue on org HTML export which can't open the resulting html
;; file (C-c C-e h o)
(setq process-connection-type nil)

(use-package magit
  :bind ("C-c C-g" . magit-status))

;; auto ssh-add — deferred, not needed during startup
(use-package ssh-agency
  :defer 3
  :config
  (setq ssh-agency-keys '("~/.ssh/id_rsa_gitlab" "~/.ssh/id_rsa")))


;;;; --- Appearance ------------------------------------------------------------

(use-package doom-themes
  ;; Global settings (defaults)
  :config
  (setq doom-themes-enable-bold t)    ; if nil, bold is universally disabled
  (setq doom-themes-enable-italic t) ; if nil, italics is universally disabled
  
  (load-theme 'doom-snazzy t)
  
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(setq frame-title-format
      '(buffer-file-name "%f" (dired-directory direct-directy "%b")))


;;;; --- Startup timing --------------------------------------------------------

(add-hook 'emacs-startup-hook
          (lambda ()
            (message "[trb] setup.el loaded in %.3fs — %d GC(s)"
                     (float-time (time-since trb/setup-start-time))
                     gcs-done)))

;;; setup.el ends here
