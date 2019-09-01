(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
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

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(use-package quelpa
  :ensure t
  :config
  (quelpa
   '(quelpa-use-package
     :fetcher git
     :url "https://framagit.org/steckerhalter/quelpa-use-package.git")
   :upgrade t
))

(require 'quelpa-use-package)

(use-package manager
  :quelpa ((manager :fetcher github :repo "pbellon/emacs-package-manager")
            :upgrade nil)
  :config
  (setq manager/dependencies-config-dir "~/.emacs.d/packages")
  (manager/load-dependencies))

