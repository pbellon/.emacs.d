;; (use-package cheat
;;   :quelpa 
;;   (cheat
;;     :fetcher github
;;     :repo "pbellon/cheat"
;;     :files 
;;     ("*.el" "*.el.in" "sheets" "sheets/*.org"
;;      "*.info" "*.texi" "*.texinfo"
;;      (:exclude ".dir-locals.el" "test.el" "tests.el" "*-test.el" "*-tests.el")))
;;   :ensure t
;;   ;; :quelpa (cheat :fetcher git :url "https://github.com/pbellon/cheat.git")
;;   :config
;;   (add-to-list 'cheat/sheets-folders "~/.emacs.d/cheatsheets")
;;   (cheat/init)
;; )
(add-to-list 'load-path "~/Dev/cheat")
(require 'cheat)
(with-eval-after-load 'cheat
  (add-to-list 'cheat/sheets-folders "~/.emacs.d/cheatsheets")
  (cheat/reload-sheets))
