;; org mode and add some key combos
(require org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; default tabbing mode, spaces instead of tabs
(setq tab-width 2)
(set-default 'indent-tabs-mode nil)

;; c coding style and default offset distanct
(setq-default c-default-style "linux"
	      c-basic-offset 2)

;; in tex mode
(require 'tex-mode)`
(add-hook 'latex-mode-hook 'flyspell-mode)

;; all backups go into .saves
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 6
      version-control t)
