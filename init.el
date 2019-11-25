;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(require 'subr-x)

(load-file "~/.emacs.d/setup.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
    [default default default italic underline success warning error])
 '(ansi-color-names-vector
    ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(column-number-mode t)
 '(company-quickhelp-color-background "#D0D0D0")
 '(company-quickhelp-color-foreground "#494B53")
 '(compilation-message-face (quote default))
 '(custom-safe-themes
    (quote
      ("b73a23e836b3122637563ad37ae8c7533121c2ac2c8f7c87b381dd7322714cd0" "0dd2666921bd4c651c7f8a724b3416e95228a13fca1aa27dc0022f4e023bf197" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(electric-indent-mode nil)
 '(fci-rule-color "#3C3D37")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
    (quote
      (("#3C3D37" . 0)
        ("#679A01" . 20)
        ("#4BBEAE" . 30)
        ("#1DB4D0" . 50)
        ("#9A8F21" . 60)
        ("#A75B00" . 70)
        ("#F309DF" . 85)
        ("#3C3D37" . 100))))
 '(line-number-mode nil)
 '(magit-diff-use-overlays nil)
 '(markdown-command "md2html")
 '(package-selected-packages
    (quote
      (eldoc-box eslintd-fix ag lsp-mode prettier-js web-mode company taskrunner evil-multiedit dash wttrin treemacs-magit treemacs-icons-dired hydra treemacs-projectile treemacs-evil treemacs lorem-ipsum mermaid-mode imenu-list counsel-projectile counsel go-mode lua-mode moody minions vterm ox-reveal cask-mode ivy-taskrunner emacs-taskrunner bui fish-mode all-the-icons asciidoc buffer-move cheat dashboard editorconfig evil evil-collection evil-numbers fill-column-indicator flycheck-pycheckers fold-dwim format-sql htmlize ivy js2-mode json-mode magit markdown-mode neotree org-babel ox-asciidoc ox-gfm plantuml-mode projectile quelpa quelpa-use-package tide typescript-mode use-package vimrc-mode yaml-mode)))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
    (quote
      ((20 . "#F92672")
        (40 . "#CF4F1F")
        (60 . "#C26C0F")
        (80 . "#E6DB74")
        (100 . "#AB8C00")
        (120 . "#A18F00")
        (140 . "#989200")
        (160 . "#8E9500")
        (180 . "#A6E22E")
        (200 . "#729A1E")
        (220 . "#609C3C")
        (240 . "#4E9D5B")
        (260 . "#3C9F79")
        (280 . "#A1EFE4")
        (300 . "#299BA6")
        (320 . "#2896B5")
        (340 . "#2790C3")
        (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
