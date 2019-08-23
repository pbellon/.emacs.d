(defconst cheat/sheets '((adoc "Asciidoc" "./sheets/asciidoc.org"))
)

(defun cheat/open (wname fname)
  (let ((buffer (generate-new-buffer (concat "* " wname " Cheatsheet *"))))
    (set-buffer-major-mode buffer)
    (switch-to-buffer-other-frame buffer)
    (insert-file-contents fname t)
    (org-mode)
))

(defun cheat/register (cheat-name cheat-wname cheat-fname)
  "Register a new cheatsheet, will create cheat/<name> interactive function"
  (let ((cheat-fn-name (intern (format "cheat/%s" cheat-name))))
    `(defun ,cheat-fn-name ()
       (interactive)
       (cheat/open ,cheat-wname ,cheat-fname))))

(defmacro cheat/setup ()
  `(progn ,@(mapcar
             (lambda (x) (cheat/register (nth 0 x) (nth 1 x) (nth 2 x)))
             cheat/sheets)))
