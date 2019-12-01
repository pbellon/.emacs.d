(use-package lsp-mode
  :ensure t
  :commands lsp
)

(use-package company-lsp
  :ensure t
  :commands company-lsp
  :hook (lsp . company-lsp)
)
