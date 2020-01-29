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
 '(column-number-mode t)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(company-quickhelp-mode t)
 '(compilation-message-face (quote default))
 '(custom-safe-themes
    (quote
      ("e1ecb0536abec692b5a5e845067d75273fe36f24d01210bf0aa5842f2a7e029f" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "cdb4ffdecc682978da78700a461cdc77456c3a6df1c1803ae2dd55c59fa703e3" "b73a23e836b3122637563ad37ae8c7533121c2ac2c8f7c87b381dd7322714cd0" "0dd2666921bd4c651c7f8a724b3416e95228a13fca1aa27dc0022f4e023bf197" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(electric-indent-mode nil)
 '(fci-rule-color "#383838")
 '(global-company-mode t)
 '(global-eldoc-mode nil)
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
 '(magit-diff-use-overlays nil)
 '(markdown-command "md2html")
 '(nrepl-message-colors
    (quote
      ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
    (quote
      (doom-themes jira-markup-mode spacemacs-light-theme spacemacs-dark-theme spacemacs-dark spacemacs-theme company-quickhelp company-mode-box company-box mermaid js-comint company-lsp scss-mode company-scss solarized-theme per-buffer-theme color-theme-buffer-local ob-mermaid eldoc-box eslintd-fix ag lsp-mode prettier-js web-mode company taskrunner evil-multiedit dash wttrin treemacs-magit treemacs-icons-dired hydra treemacs-projectile treemacs-evil treemacs lorem-ipsum mermaid-mode imenu-list counsel-projectile counsel go-mode lua-mode moody minions vterm ox-reveal cask-mode ivy-taskrunner emacs-taskrunner bui fish-mode all-the-icons asciidoc buffer-move cheat dashboard editorconfig evil evil-collection evil-numbers fill-column-indicator flycheck-pycheckers fold-dwim format-sql htmlize ivy js2-mode json-mode magit markdown-mode neotree org-babel ox-asciidoc ox-gfm plantuml-mode projectile quelpa quelpa-use-package tide typescript-mode use-package vimrc-mode yaml-mode)))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
    (quote
      ((20 . "#BC8383")
        (40 . "#CC9393")
        (60 . "#DFAF8F")
        (80 . "#D0BF8F")
        (100 . "#E0CF9F")
        (120 . "#F0DFAF")
        (140 . "#5F7F5F")
        (160 . "#7F9F7F")
        (180 . "#8FB28F")
        (200 . "#9FC59F")
        (220 . "#AFD8AF")
        (240 . "#BFEBBF")
        (260 . "#93E0E3")
        (280 . "#6CA0A3")
        (300 . "#7CB8BB")
        (320 . "#8CD0D3")
        (340 . "#94BFF3")
        (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
