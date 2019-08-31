;;; manager.el --- pseudo dependency manager based on use-package  -*- lexical-binding:t -*-
;;; Commentary:

;;; The idea is to get a simple way to add & manage dependencies like following:
;; (setq manager/dependencies
;;  '(
;;    'all-the-icons
;;    'asciidoc
;;    'cheat
;;    'evil
;;    'fill-column-indicator
;;    'ibuffer
;;    'ivy
;;    'js
;;    'magit
;;    'markdown
;;    'neotree
;;    'nlinum-mode
;;    'org-mode
;;    'plantuml
;;    'projectile
;;    'tide
;;    )
;; )
;; (manager/setup)
;; It should check that every listed dependency has a corresponding
;; <dependency name>.el file located in manager/dependency-config-dir. if not it 
;; should create it when manager/setup is called.
;; 
;; Another functionnality would be to add with command similar as package-install
;; with =M-x manager/add RET <dependency name>= that will add it to the
;; dependency file located at manager/dependency-config-file.

(defun m-fname (name)
  "Return the filname of the dependency"
  (format "%s/%s.el" manager/dependencies-config-dir name))

(defun m-reload-dep (name)
  "Reload a single dependency, creates a <name>.el with a (user-package ...) template"
  (unless (file-exists-p (m-fname name))
    (write-region
     (format "(use-package %s\n  :ensure t)" name)
     nil
     (m-fname name)))
  (load-file (m-fname name))
)
      
(defun m-update-dependency-list (&optional new)
    (let ((new-lines (with-temp-buffer
        (insert-file-contents manager/dependency-config-file)
        (delete-matching-lines "^(;\(manager|'\()")
        (goto-char (point-max))
        (if (not (eq new nil)) (insert (format "  '%s" new)))
        (sort-lines)
        (buffer-subtring (point-min) (point-max)))))
      (with-temp-buffer
        (insert-file-contents manager/dependency-config-file)
        (query-replace-regexp "^[\W]*'" new-lines)
        (write-file manager/dependency-config-file))))         

(defun m-reload-deps ()
  (dolist (el manager/dependencies value)
    (message (format "Loading %s" el))
    (m-reload-dep el)))


(defcustom manager/dependencies-config-file nil
  "The file used to register depencies"
  :type 'string
  :group 'manager)

(defcustom manager/dependencies-config-dir nil
  "The folder to use for dependencies configuration"
  :type 'string
  :group 'manager)

(defcustom manager/dependencies nil
  "The dependencies list"
  :type 'list
  :group 'manager)

(defun manager/setup ()
  "Trigger dependency initialization, will create files if it does not exist"
  (m-reload-deps))

(defun manager/reload-dependencies ()
    "Load all defined dependencies"
    (interactive)
    (message "[manager] - Reloading dependencies")
    (m-reload-deps))

(defun manager/add ()
  "Create a new dependency file in the dependencies config dir, see =manager/dependencies-config-dir="
  (interactive)
  (let ((name (read-string "[manager] - Dependency name?\n> ")))
     (m-update-dependency-list name)
     (m-reload-deps)))



(provide 'manager)
