(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode/elpa/") t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
