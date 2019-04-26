;; plantuml
(use-package plantuml-mode
  :after org
  :ensure t
  :config
  (global-unset-key (kbd "C-x C-u"))
  (global-set-key (kbd "C-x C-u C-c") '(lambda () (interactive) (plantuml-preview 4)))
  (setq plantuml-jar-path "~/opt/plantuml.jar")
  (setq org-plantuml-jar-path plantuml-jar-path)
  (add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
  (add-to-list 'auto-mode-alist '("\\.puml\\'" . plantuml-mode))
  (org-babel-do-load-languages 'org-babel-load-languages
			       '((plantuml . t))))
