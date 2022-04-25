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
 '(compilation-message-face 'default)
 '(custom-safe-themes
    '("8f0a782ba26728fa692d35e82367235ec607d0c836e06bc39eb750ecc8e08258" default))
 '(electric-indent-mode nil)
 '(global-company-mode t)
 '(highlight-changes-colors '("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
    '(("#3C3D37" . 0)
       ("#679A01" . 20)
       ("#4BBEAE" . 30)
       ("#1DB4D0" . 50)
       ("#9A8F21" . 60)
       ("#A75B00" . 70)
       ("#F309DF" . 85)
       ("#3C3D37" . 100)))
 '(ivy-mode t)
 '(jdee-db-active-breakpoint-face-colors (cons "#171F24" "#237AD3"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#171F24" "#579C4C"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#171F24" "#777778"))
 '(magit-diff-use-overlays nil)
 '(markdown-command "md2html")
 '(nil nil t)
 '(objed-cursor-color "#D16969")
 '(org-support-shift-select 'always)
 '(package-selected-packages
    '(ox-jira emojify vscode-dark-plus-theme swiper ace-window company-graphviz-dot graphviz-dot-mode dot-mode treemacs-all-the-icons eglot monokai-theme lsp-java elpy jump company-box adoc-mode lsp-ui org-projectile fic-mode spacemacs-dark-theme origami fireplace exec-path-from-shell add-node-modules-path js-comint company-lsp scss-mode company-scss solarized-theme per-buffer-theme color-theme-buffer-local ob-mermaid eldoc-box eslintd-fix ag lsp-mode prettier-js web-mode taskrunner evil-multiedit dash treemacs-magit treemacs-icons-dired hydra treemacs-projectile treemacs lorem-ipsum mermaid-mode imenu-list counsel-projectile counsel go-mode lua-mode moody minions vterm ox-reveal cask-mode ivy-taskrunner emacs-taskrunner bui fish-mode all-the-icons asciidoc buffer-move cheat dashboard editorconfig evil-collection evil-numbers fill-column-indicator flycheck-pycheckers fold-dwim format-sql htmlize ivy js2-mode json-mode magit markdown-mode neotree org-babel ox-asciidoc ox-gfm plantuml-mode projectile quelpa quelpa-use-package tide typescript-mode use-package vimrc-mode yaml-mode))
 '(projectile-mode t nil (projectile))
 '(rustic-ansi-faces
    ["#1e1e1e" "#D16969" "#579C4C" "#D7BA7D" "#339CDB" "#C586C0" "#85DDFF" "#d4d4d4"])
 '(treemacs-follow-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
