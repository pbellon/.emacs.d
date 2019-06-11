(use-package lsp-mode
  :ensure t
  :hook ((javascript-mode typescript-mode) . lsp)
  :init
  ;; TODO: communiquer avec SonarLint-Core via son Language Server.
  ;; (lsp-register-client
  ;;  (make-lsp-client :new-connection (lsp-tramp-connection "binary-or-full-path" )))
  )
