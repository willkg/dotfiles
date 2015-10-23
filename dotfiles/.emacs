(add-to-list 'load-path "~/elisp")

;; makes buffer names clearer.  no more test<13> silliness.
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killling uniquified buffers
(setq uniquify-ignore-buffers-re "^\\*") ; don't uniquify special buffers


;; from brian's emacs file

; decorate text if possible
(cond ((fboundp 'global-font-lock-mode)
    ;; Turn on font-lock in all modes that support it
    (global-font-lock-mode t)
    ;; maximum colors
    (setq font-lock-maximum-decoration t)))

; disable tabs...  and then
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)

; disable blinking cursor
(blink-cursor-mode 0)
; disable icon bar on "windows" systems
(tool-bar-mode 0)
; disable menu bar
(menu-bar-mode 0)
; avoid the opening 'splash screen' and startup message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

; show column as well as lines
(setq column-number-mode t)
(setq line-number-mode t)

; set visible bell
(setq visible-bell t)

; show time
(display-time)

; puts the scrollbar on the right
(setq scroll-bar-mode-explicit t)
(set-scroll-bar-mode `right)

; y or n rather than yes or no
(fset 'yes-or-no-p 'y-or-n-p)

; show parens
(show-paren-mode t)

; line numbers
(global-linum-mode t)
(setq linum-format "%3d")

; save backups to a specific directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

; remap C-x + C-g to goto-line
(global-set-key "\C-x\C-g" 'goto-line)

; region-based stuff
(setq transient-mark-mode t)

; allows me to do shift-arrow-keys to move between windows
(windmove-default-keybindings 'meta)

; x select copies contents to clipboard
(setq x-select-enable-clipboard t)

; editorconfig
; (load "editorconfig")
(load-file "~/elisp/editorconfig.el")

; less-mode
(load "less-css-mode")

; web-mode stuff
; http://web-mode.org/
(load-file "~/elisp/web-mode.el")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-engines-alist
    '(("django" . "\\.html\\'"))
)
(setq web-mode-markup-indent-offset 2)

; this is for a new theme
(load-file "~/elisp/naquadah-theme.el")

;; use flymake as a minor mode for .py files and use pyflakes
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init))
  (delete '("\\.html?\\'" flymake-xml-init) flymake-allowed-file-name-masks))

(setq py-continuation-offset 4)

(add-hook 'find-file-hook 'flymake-find-file-hook)

(load-file "~/elisp/flymake-easy.el")
(load-file "~/elisp/flymake-jslint.el")
(require 'flymake-jslint)
(add-hook 'js-mode-hook 'flymake-jslint-load)

;; for workspaces
(load-file "~/elisp/workspaces.el")
(global-set-key "\C-cw" 'workspace-goto)

; javascript fixes
(setq js-indent-level 4)

;; this is to fix emacs indenting of closing brackets
(load-file "~/elisp/ad-activate.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#252A2B" :foreground "#eeeeec" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "unknown" :family "Inconsolata")))))
