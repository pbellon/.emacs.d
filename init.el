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
 '(custom-enabled-themes '(monokai))
 '(custom-safe-themes
    '("2925ed246fb757da0e8784ecf03b9523bccd8b7996464e587b081037e0e98001" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "229c5cf9c9bd4012be621d271320036c69a14758f70e60385e87880b46d60780" "d5d2ab76985738c142adbe6a35dc51c8d15baf612fdf6745c901856457650314" "2cdc13ef8c76a22daa0f46370011f54e79bae00d5736340a5ddfe656a767fddf" "1c8171893a9a0ce55cb7706766e57707787962e43330d7b0b6b0754ed5283cda" "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" "e1ecb0536abec692b5a5e845067d75273fe36f24d01210bf0aa5842f2a7e029f" "d1c7f2db070c96aa674f1d61403b4da1fff2154163e9be76ce51824ed5ca709c" "cdb4ffdecc682978da78700a461cdc77456c3a6df1c1803ae2dd55c59fa703e3" "b73a23e836b3122637563ad37ae8c7533121c2ac2c8f7c87b381dd7322714cd0" "0dd2666921bd4c651c7f8a724b3416e95228a13fca1aa27dc0022f4e023bf197" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default))
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
 '(jdee-db-active-breakpoint-face-colors (cons "#171F24" "#237AD3"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#171F24" "#579C4C"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#171F24" "#777778"))
 '(magit-diff-use-overlays nil)
 '(markdown-command "md2html")
 '(nil nil t)
 '(objed-cursor-color "#D16969")
 '(package-selected-packages
    '(eglot monokai-theme lsp-java elpy jump company-box adoc-mode lsp-ui org-projectile fic-mode spacemacs-dark-theme origami fireplace exec-path-from-shell add-node-modules-path js-comint company-lsp scss-mode company-scss solarized-theme per-buffer-theme color-theme-buffer-local ob-mermaid eldoc-box eslintd-fix ag lsp-mode prettier-js web-mode company taskrunner evil-multiedit dash wttrin treemacs-magit treemacs-icons-dired hydra treemacs-projectile treemacs-evil treemacs lorem-ipsum mermaid-mode imenu-list counsel-projectile counsel go-mode lua-mode moody minions vterm ox-reveal cask-mode ivy-taskrunner emacs-taskrunner bui fish-mode all-the-icons asciidoc buffer-move cheat dashboard editorconfig evil evil-collection evil-numbers fill-column-indicator flycheck-pycheckers fold-dwim format-sql htmlize ivy js2-mode json-mode magit markdown-mode neotree org-babel ox-asciidoc ox-gfm plantuml-mode projectile quelpa quelpa-use-package tide typescript-mode use-package vimrc-mode yaml-mode))
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
