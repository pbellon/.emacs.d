
(defun js2-hook ()
  ;; setting symbols instead of strings also don't work
  (dolist
      (js2-globals '("utils" "goog" "bg" "draw2d" "angular" "$" "jQuery" "console" "_" "window" "setTimeout"))
    (add-to-list 'js2-global-externs js2-globals)))

(use-package js2-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  ;; (add-hook 'js-mode-hook 'js2-mode)
  (add-hook 'js2-mode-hook 'js2-hook)
)
