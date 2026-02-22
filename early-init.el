;;; early-init.el --- Early startup tweaks -*- lexical-binding: t; -*-

;; Defer package.el so we control when it initializes.
(setq package-enable-at-startup nil)
(setq package-quickstart t)

;; Raise GC limits during init, reset after startup for snappier boot.
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 64 1024 1024)
                  gc-cons-percentage 0.1)))

;; Avoid frame resizing work during init and drop UI chrome ASAP.
(setq frame-inhibit-implied-resize t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
;; disable the beep on error & use visual feedback instead
(setq visible-bell t)

;; Disable built-in VC git backend — magit handles git entirely.
;; Done here so it never activates, even before magit loads.
(setq vc-handled-backends (delq 'Git vc-handled-backends))

;; Set font on the default frame before any frame is created to avoid
;; a resize/redraw when setup.el runs set-frame-font later.
(defun trb/first-available-font (candidates)
  "Return the first font family from CANDIDATES that is installed."
  (catch 'found
    (dolist (f candidates)
      (when (member f (font-family-list))
        (throw 'found f)))))

(when-let ((font (trb/first-available-font
                  '("Fira Code" "Cascadia Mono" "Consolas"
                    "Menlo" "DejaVu Sans Mono"))))
  (add-to-list 'default-frame-alist (cons 'font (concat font "-12"))))

(provide 'early-init)
;;; early-init.el ends here
