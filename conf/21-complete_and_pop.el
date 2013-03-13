;;; 補完候補の表示
;;(add-to-list 'load-path "~/src/auto-complete/auto-complete-1.3.1")
;; (require 'auto-complete)
;; (global-auto-complete-mode 1)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
(ac-config-default)
(add-hook 'auto-complete-mode-hook
          (lambda ()
            (define-key ac-completing-map (kbd "C-n") 'ac-next)
            (define-key ac-completing-map (kbd "C-p") 'ac-previous)))
;; lisp-modeとslimeで自動補完する
(add-to-list 'ac-modes 'lisp-mode)
(add-to-list 'ac-modes 'slime-repl-mode)
;;; ac-mode
;(autoload 'ac-mode "ac-mode" "Minor mode for advanced completion." t nil)


;;; バッファのポップアップ
(if (require 'popwin nil t)
    (progn
      (setq display-buffer-function 'popwin:display-buffer)
      (setq popwin:popup-window-height 0.4)
      (setq anything-samewindow nil)
      (push '("*anything*" :height 14) popwin:special-display-config)
      (push '(dired-mode :position top) popwin:special-display-config)
      (push '("\\*[Vv][Cc]" :regexp t :position top) popwin:special-display-config)
      (push '("\\*git-" :regexp t :position top) popwin:special-display-config)
      (push '(" *auto-async-byte-compile*" :height 10 :position bottom :noselect t) popwin:special-display-config)
      (push '("*Compile-Log*" :height 10 :position bottom :noselect t) popwin:special-display-config)
      (push '("*VC-log*" :height 10 :position bottom) popwin:special-display-config)
      (push '("*anything kill-ring*" :height 14) popwin:special-display-config)
      ))
;; slime用の設定
;; Apropos
(push '("*slime-apropos*") popwin:special-display-config)
;; Macroexpand
(push '("*slime-macroexpansion*") popwin:special-display-config)
;; Help
(push '("*slime-description*") popwin:special-display-config)
;; Compilation
(push '("*slime-compilation*" :noselect t) popwin:special-display-config)
;; Cross-reference
(push '("*slime-xref*") popwin:special-display-config)
;; Debugger
(push '(sldb-mode :stick t) popwin:special-display-config)
;; REPL
(push '(slime-repl-mode) popwin:special-display-config)
;; Connections
(push '(slime-connection-list-mode) popwin:special-display-config)
