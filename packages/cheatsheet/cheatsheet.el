
(defvar cheat/registry (make-hash-table :test 'equal))

(defun cheat/open (name))


(defun cheat/register (name fname)
  "Register a new cheatsheet, will create cheat/<name> interactive function"
  (puthash name fname cheat/registry)
  (eval `(defun cheat/,name ()
           (interactive)
           (cheat/open ',name))))
)

(defun cheat/setup ()
  )


(defun test (name)
  (eval `(defun ,name ()
           (interactive)
           (message "It works"))
        ))

(test 'toto)
