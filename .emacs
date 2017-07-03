;; c coding style and default offset distanct
(require 'cc-mode)
(setq-default c-default-style "linux"
	      c-basic-offset 2)
(setq tab-width 2)
(set-default 'indent-tabs-mode nil)
(setq-default substatement-open 0)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
(setq inhibit-startup-methods t)
(setq-default show-trailing-whitespace t)

; whitespace
(require 'whitespace)
(setq whitespace-style '(tabs tab-mark)) ; whitespace mode on only for tabs
(global-whitespace-mode 1)

