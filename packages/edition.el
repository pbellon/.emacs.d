;; Folding behavior 
(add-hook 'prog-mode-hook #'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook #'show-paren-mode)

(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)

(eval-after-load 'hideshow
  '(progn
     (global-set-key (kbd "C-c C-f") 'hs-toggle-hiding)))

(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line.

Move point to the first non-whitespace character on this line.
If point was already at that position, move point to beginning of line."
  (interactive "^") ; Use (interactive) in Emacs 22 or older
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))

(global-set-key [home] 'smart-beginning-of-line)
