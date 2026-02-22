
;;;; Step 0) init --------------------------------------------------------------

;; setting coding-system
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

;; set to nil to convert DOS EOL to UNIX on save
(setq inhibit-eol-conversion 1)

(if (not (boundp 'server-process))
  (server-start))


;;;; Step 1) custom variables --------------------------------------------------

(defvar user-emacs-config-file "~/.emacs.d/init.el")
(defvar user-emacs-config-dir "~/.emacs.d/"),

;;;; Step 2) custom functions ----------------------------------------------------

;; Check if running emacs on windows
(defun on-windows ()
  "Returns true if running emacs on windows"
  (memq system-type '(windows-nt ms-dos)))

(defun reload-emacs-config ()
  "Reload init.el"
  (interactive)
  (load-file user-emacs-config-file))

(defun open-emacs-config ()
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

(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(defun switch-to-minibuffer ()
  "Switch to minibuffer window."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))
    (error "Minibuffer is not active")))

;;;; ----------------- Global keybindings ----------------------------------------

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

;; general edition keybindings
(global-set-key (kbd "<f5>") 'sort-lines)
(global-set-key (kbd "C-c C-/") #'comment-or-uncomment-region)
(global-set-key (kbd "M-<up>") #'move-line-up)
(global-set-key (kbd "M-<down>") #'move-line-down)

(global-set-key (kbd "C-c C-c b") #'switch-to-minibuffer)
(global-set-key (kbd "C-c C-g") #'magit-status)
(global-set-key (kbd "C-x C-/") #'revert-buffer)


;; Defines list of kbd translations for special unicode chars.
(define-key key-translation-map (kbd "<f9> p") (kbd "φ"))
(define-key key-translation-map (kbd "<f9> d") (kbd "Δ"))

;; go to start of line
(global-set-key [home] 'smart-beginning-of-line)


;;;; Step 4) Setup use-package & external deps tools ---------------------------
(package-initialize)

(let* ((no-ssl (and (on-windows)
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  
  (add-to-list 'package-archives
	       (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives
	       (cons "gnu" (concat proto "://elpa.gnu.org/packages/")) t)
  (add-to-list 'package-archives
	       (cons "org" (concat proto "://orgmode.org/elpa/")) t)

  ;;(Add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))

;; (setq package-check-signature nil)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t 
        use-package-expand-minimally t))


;;;; Step 5) Contextual configurations -----------------------------------------

;;;; Step 5.1) Edition  --------------------------------------------------------
(add-hook 'prog-mode-hook #'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook #'show-paren-mode)

(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)

(use-package markdown-mode
  :ensure t
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
  :ensure t
  :config
  ;; (setq org-html-htmlize-output-type 'inline-css) ;; default
  (setq org-html-htmlize-output-type 'css)
  ;; (setq org-html-htmlize-font-prefix "") ;; default
  (setq org-html-htmlize-font-prefix "org-"))

;; markdown export backend
(use-package ox-gfm
  :ensure t
  :after org)

(setq org-publish-project-alist nil)

(defun org-refresh ()
  "Refresh parsed tree for current buffer"
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
  "Parse the buffer and return a cons list of (property . value)"
  (org-element-map (org-element-parse-buffer 'element) 'keyword
    (lambda (keyword) (cons
                        (org-element-property :key keyword)
                        (org-element-property :value keyword)))))

(defun get-org-keyword (key &optional kwds)
  "return the value associated to key"
  (unless kwds (setq kwds (get-org-keywords)))
  (cdr (assoc key props)))

;; customization of org behavior
(with-eval-after-load 'org
  (setq org-src-fontify-natively t)
  (setq org-html-doctype "html5")
  (setq org-image-actual-width 400)

  (customize-set-value 'org-latex-with-hyperref nil)

  (add-to-list 'org-latex-default-packages-alist "\\PassOptionsToPackage{hyphens}{url}")

  (add-hook 'org-mode-hook #'visual-line-mode)
  (add-hook 'org-mode-hook #'fixed-font-on-needing-blocks)

  (setq org-todo-keywords
    '((sequence "TODO(t)" "NOW(n)" "LATER(l)" "REVIEW(r)" "|" "INREVIEW(ir)" "WAITING" "DONE(D)" "CANCELED(c)" "DELEGATED(d)")))

 ;; don't ask to evaluate source code block
  (setq org-confirm-babel-evaluate nil)
  ;; activate shell language for babel
  (org-babel-do-load-languages 'org-babel-load-languages
    '((shell t)))

  ;; Keybindings
  (define-key org-mode-map (kbd "C-c L") #'org-toggle-link-display)
  (define-key org-mode-map (kbd "C-c i") (lambda () (org-display-inline-images t t)))
  (define-key org-mode-map (kbd "C-c D") 'org-set-to-done)

  ;; global keybindings
  (global-set-key (kbd "C-c l") #'org-store-link)
  (global-set-key (kbd "C-c a") #'org-agenda)
  (global-set-key (kbd "C-c c") #'org-capture))


;;;; Step 5.2) Appearance ------------------------------------------------------

(use-package doom-themes
  :ensure t
  ;; Global settings (defaults)
  :config
  (setq doom-themes-enable-bold t)    ; if nil, bold is universally disabled
  (setq doom-themes-enable-italic t) ; if nil, italics is universally disabled
  
  (load-theme 'doom-snazzy t)
  
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(setq frame-title-format
      '(buffer-file-name "%f" (dired-directory direct-directy "%b")))


;;;; Step 5.3) Transversal ----------------------------------------------------

;; disable the beep
;; (setq ring-bell-function 'ignore)

;; instead show the error
(setq visible-bell t)

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

;; Fixes xdg-open issue on org HTML export which can't open the resulting html 
;; file (C-c- C-e h o)
(setq process-connection-type nil)

(use-package magit
  :ensure t
  :config
  (setq vc-handled-backends (delq 'Git vc-handled-backends))
)

;; auto ssh-add 
(use-package ssh-agency :ensure t
 :config
 (setq ssh-agency-keys '("~/.ssh/id_rsa_gitlab" "~/.ssh/id_rsa"))
)

