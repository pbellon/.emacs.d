;;; manager.el --- pseudo dependency manager based on use-package  -*- lexical-binding:t -*-
(toggle-debug-on-error t)
(setq m-debug t)

(defun m-fname (name)
  "Return the filname of the dependency"
  (format "%s/%s.el" manager/dependencies-config-dir name))

(defun m-reload-dep (name)
  (unless (file-exists (m-fname name))
    (write-region
     (format "(use-package %s)" name)
     nil
     m-filename))
  (load (m-fname name))
)
      
(defun m-update-dependency-list (new)
    (let ((new-lines (with-temp-buffer
        (insert-file-content manage/dependency-config-file)
        (delete-matching-lines "^(;|\(manager|'\()")
        (goto-char (point-max))
        (insert (f "  '%s" new))
        (buffer-subtring (point-min) (point-max))))) 
      (with-temp-buffer
        (insert-file-content manage/dependency-config-file)
        (query-replace-regexp "^[\W]*'" new-lines)
        (write-file manage/dependency-config-file))))
          

(defun m-reload-deps ()
  (dolist (el manage/dependencies value)
    (if (m-debug) (message (f "Loading %s " value)))
    (m-reload-dep el)))

(m-reload-deps)

(defcustom manager/dependencies-config-dir nil
  "The folder to use for dependencies configuration"
  :type 'string
  :group 'manager))

(defcustom manager/dependencies
  "The dependencies list"
  :type 'list)

(defun f (str &optional val) (format str val))

(defun manager/setup ()
  (m-reload-deps))

(defun manager/reload-dependencies
    "Load all defined dependencies"
    (interactive)
    (message (f "[%s] - Reloading dependencies" m-package-name))
    (m-reload-deps))

(defun manager/add
    "Create a new dependency file in the dependencies config dir, see =manager/dependencies-config-dir="
  (interactive)
  (let ((name (read-string (f "[%s] - Dependency name?\n> " m-package-name))))
    (add-to-list 'name manager/dependencies)
    (manager/reload-dependencies)))
