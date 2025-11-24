(require 'package)

(package-initialize)

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

;; (setq package-check-signature nil)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")



;; (unless package-archive-contents
  ;; (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (setq use-package-always-ensure t 
        use-package-expand-minimally t))

(load-pkgs)
