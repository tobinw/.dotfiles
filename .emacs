;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(setq debug-on-error t)

; use melpa when we can
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
  )
(prefer-coding-system 'utf-8)

; make sure we have cc-mode, force *.h files to use c++ mode
(require 'cc-mode)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)
(define-key c-mode-map [(tab)] 'company-complete)
(define-key c++-mode-map [(tab)] 'company-complete)

; add rtags directories to exec and load paths
(add-to-list 'exec-path "/fasttmp/wtobin/develop/install/rtags/bin")
(add-to-list 'load-path "/fasttmp/wtobin/develop/rtags/rtags/src")

; startup and configure rtags and company-rtags when using cc-mode
(eval-after-load 'cc-mode
  '(progn
     (require 'rtags)
     (require 'company-rtags)
     (setq rtags-completions-enabled t)
     (eval-after-load 'company
       '(add-to-list
         'company-backends 'company-rtags))
     (setq rtags-autostart-diagnostics t)
     (setq rtags-rdm-includes '("/fasttmp/wtobin/develop/install/llvm/lib/clang/5.0.0/include/"))
     (add-hook 'find-file-hook 'rtags-start-process-maybe)
     (mapc (lambda (x)
             (define-key c-mode-base-map
               (kbd (concat "C-c r" (car x))) (cdr x)))
           '(("." . rtags-find-symbol-at-point)
             ("," . rtags-find-references-at-point)
             ("v" . rtags-find-virtuals-at-point)
             ("V" . rtags-print-enum-value-at-point)
             ("/" . rtags-find-all-references-at-point)
             ("Y" . rtags-cycle-overlays-on-screen)
             (">" . rtags-find-symbol)
             ("<" . rtags-find-references)
             ("-" . rtags-location-stack-back)
             ("+" . rtags-location-stack-forward)
             ("D" . rtags-diagnostics)
             ("G" . rtags-guess-function-at-point)
             ("p" . rtags-set-current-project)
             ("P" . rtags-print-dependencies)
             ("e" . rtags-reparse-file)
             ("E" . rtags-preprocess-file)
             ("R" . rtags-rename-symbol)
             ("M" . rtags-symbol-info)
             ("S" . rtags-display-summary)
             ("O" . rtags-goto-offset)
             (";" . rtags-find-file)
             ("F" . rtags-fixit)
             ("X" . rtags-fix-fixit-at-point)
             ("B" . rtags-show-rtags-buffer)
             ("I" . rtags-imenu)
             ("T" . rtags-taglist)))))

; c/c++ formatting rules
(setq c-default-style "linux"
      c-basic-offset 2)
(c-set-offset 'substatement-open 0)
(setq-default indent-tabs-mode nil)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
(setq inhibit-startup-message t)
(setq-default show-trailing-whitespace t)

; yasnippet c++ snippets to speed things up ; installed using melpa
(require 'yasnippet)
(yas-global-mode 1)

;whitespace http://www.emacswiki.org/emacs/WhiteSpace
(require 'whitespace)
; tabs are EVIL
(setq whitespace-style '(tabs tab-mark)) ;turns on white space mode only for tabs
; show whitespace at the end of lines as well
(global-whitespace-mode 1)

;(setq org-log-done 'time)
;(setq org-log-done 'note)

; auto-highlight-mode, highlight matching symbols in the same buffer
(add-to-list 'load-path "/users/wtobin/.emacs.d/auto-highlight-symbol-mode-master/")
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)

;; toggle window dedication - trying to get compiler output to go to a sensible buffer
(setq split-width-threshold nil)
(setq split-height-threshold nil)
(defadvice pop-to-buffer (before cancel-other-window first)
  (ad-set-arg 1 nil))
(ad-activate 'pop-to-buffer)
(defun toggle-window-dedicated ()
  "Toggle whether the current active window is dedicated or not"
  (interactive)
  (message
   (if
       (let
           (window (get-buffer-window (current-buffer)))
         (set-window-dedicated-p window (not (window-dedicated-p window)))
         )
       "Window '%s' is dedicated"
     "Window '%s' is normal")
   (current-buffer)
   )
  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yasnippet rtags rudel minimap color-theme autopair))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
