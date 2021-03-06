(require 'package)

(setq pkgs-folder "~/.emacs.d/packages")

(defun load-pkg (pkg-name)
  (load (expand-file-name (format "%s/%s" pkgs-folder pkg-name))))

(defun list-pkgs ()
  "Return all proper lisp files from pkgs-folder"
  (directory-files (expand-file-name (format "%s/" pkgs-folder)) nil "[a-z][a-z-]+.el$"))

(defun load-pkgs ()
  "Will reload all packages under 'pkg-folder"
  (interactive)
  (mapc 'load-pkg (list-pkgs)))
  
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

(package-initialize)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(setq package-check-signature nil)
(add-to-list 'package-unsigned-archives "undo-tree")
(add-to-list 'load-path "~/.emacs.d/deps")
(package-refresh-contents "U")

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(use-package quelpa :ensure t)

(use-package quelpa-use-package
  :ensure t
  :after (quelpa)
  :config
  ;; this allows us to automatically load all elisp files under <emacs dir>/packages/
  (load-pkgs)
)
