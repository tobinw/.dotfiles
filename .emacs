(require org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq tab-width 2)
(set-default 'indent-tabs-mode nil)

(setq-default c-default-style "linux"
	      c-basic-offset 2)

(setq-default indent-tabs-mode nil)

;; in tex mode
(require 'tex-mode)`
(add-hook 'latex-mode-hook 'flyspell-mode)
