;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(require 'subr-x)

(message "trb emacs")

;; (emacs-version)

(load-file "~/.emacs.d/setup.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(column-number-mode t)
 '(compilation-message-face 'default)
 '(custom-safe-themes
   '("22a0d47fe2e6159e2f15449fcb90bbf2fe1940b185ff143995cc604ead1ea171"
     "c9d837f562685309358d8dc7fccb371ed507c0ae19cf3c9ae67875db0c038632"
     "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19"
     "d12b1d9b0498280f60e5ec92e5ecec4b5db5370d05e787bc7cc49eae6fb07bc0"
     "9b9d7a851a8e26f294e778e02c8df25c8a3b15170e6f9fd6965ac5f2544ef2a9"
     "d97ac0baa0b67be4f7523795621ea5096939a47e8b46378f79e78846e0e4ad3d"
     "921f165deb8030167d44eaa82e85fcef0254b212439b550a9b6c924f281b5695"
     "4990532659bb6a285fee01ede3dfa1b1bdf302c5c3c8de9fad9b6bc63a9252f7"
     "a9eeab09d61fef94084a95f82557e147d9630fbbb82a837f971f83e66e21e5ad"
     "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33"
     "720838034f1dd3b3da66f6bd4d053ee67c93a747b219d1c546c41c4e425daf93"
     "7de64ff2bb2f94d7679a7e9019e23c3bf1a6a04ba54341c36e7cf2d2e56e2bcc"
     "2dd4951e967990396142ec54d376cced3f135810b2b69920e77103e0bcedfba9"
     "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b"
     "0c08a5c3c2a72e3ca806a29302ef942335292a80c2934c1123e8c732bb2ddd77"
     "636b135e4b7c86ac41375da39ade929e2bd6439de8901f53f88fde7dd5ac3561"
     "51c71bb27bdab69b505d9bf71c99864051b37ac3de531d91fdad1598ad247138"
     "8f0a782ba26728fa692d35e82367235ec607d0c836e06bc39eb750ecc8e08258"
     default))
 '(electric-indent-mode nil)
 '(global-company-mode t)
 '(highlight-changes-colors '("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
   '(("#3C3D37" . 0) ("#679A01" . 20) ("#4BBEAE" . 30) ("#1DB4D0" . 50)
     ("#9A8F21" . 60) ("#A75B00" . 70) ("#F309DF" . 85)
     ("#3C3D37" . 100)))
 '(ispell-dictionary nil)
 '(ivy-mode t)
 '(magit-diff-use-overlays nil)
 '(objed-cursor-color "#D16969")
 '(org-support-shift-select 'always)
 '(package-selected-packages
   '(ace-window codex-cli counsel dired-gitignore doom-themes
                elisp-format htmlize imenu-list keychain-environment
                magit markdown-mode ox-gfm ssh-agency transpose-frame
                use-package)))
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
