;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; anything関連の設定 ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 基本設定
(require 'anything)
;(require 'anything-startup)
; 動作チューニング
(setq
 ; 候補を表示するまでの時間。初期値は0.5
 anything-idle-delay 0.3
 ; タイプして再描写するまでの時間。初期値は0.1
 anything-input-idle-delay 0.2
 ; 候補の最大表示数。初期値は50
 anything-candidate-number-limit 100
 ; 候補が多い時に体感速度を速くする
 anything-quick-update t
 ; 候補選択ショートカットキーをアルファベットに
 anything-enable-shortcuts 'alphabet)
(require 'anything-config)
; root権限でアクションを実行するときのコマンド
; デフォルトは"su"
(setq anything-su-or-sudo "sudo")
; M-xでanything起動
(define-key global-map (kbd "M-x")
  (lambda ()
    (interactive)
    (anything-other-buffer
     '(anything-c-source-extended-command-history anything-c-source-emacs-commands)
     "*anything emacs commands*")))
; 履歴にデフォルト表示させるコマンド
(setq extended-command-history
     '( "anything-for-files" "perltidy-region" "eval-region" "eval-buffer"))
(require 'anything-match-plugin nil t)
(require 'anything-complete)
; Lispシンボルの補完候補の再検索時間
(anything-lisp-complete-symbol-set-timer 150)
(require 'anything-show-completion nil t)
(require 'anything-auto-install nil t)

;; describe-bindingsをAnythingに置き換える
(when (require 'descbinds-anything nil t)
  (descbinds-anything-install))

;; M-yにanything-show-kill-ringを割り当てる
(define-key global-map (kbd "M-y") 'anything-show-kill-ring)

;; anythingフレームワークでフォントを確認する
(require 'cl)  ; loop, delete-duplicates
(defun anything-font-families ()
  "Preconfigured `anything' for font family."
  (interactive)
  (flet ((anything-mp-highlight-match () nil))
    (anything-other-buffer
     '(anything-c-source-font-families)
     "*anything font families*")))
(defun anything-font-families-create-buffer ()
  (with-current-buffer
      (get-buffer-create "*Fonts*")
    (loop for family in (sort (delete-duplicates (font-family-list)) 'string<)
          do (insert
              (propertize (concat family "\n")
                          'font-lock-face
                          (list :family family :height 2.0 :weight 'bold))))
    (font-lock-mode 1)))
(defvar anything-c-source-font-families
  '((name . "Fonts")
    (init lambda ()
          (unless (anything-candidate-buffer)
            (save-window-excursion
              (anything-font-families-create-buffer))
            (anything-candidate-bufferx
             (get-buffer "*Fonts*"))))
    (candidates-in-buffer)
    (get-line . buffer-substring)
    (action
     ("Copy Name" lambda
      (candidate)
      (kill-new candidate))
     ("Insert Name" lambda
      (candidate)
      (with-current-buffer anything-current-buffer
        (insert candidate))))))





;;;;;;;;;;;;;;;;
;;; 補完機能 ;;;
;;;;;;;;;;;;;;;;

;;; auto-complete-mode ;;;

;; (require 'auto-complete)
;; (global-auto-complete-mode 1)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
(ac-config-default)
(add-hook 'auto-complete-mode-hook
          (lambda ()
            (define-key ac-completing-map (kbd "C-n") 'ac-next)
            (define-key ac-completing-map (kbd "C-p") 'ac-previous)))
;; ac-modeに各モードを追加する
(add-to-list 'ac-modes 'lisp-mode)
(add-to-list 'ac-modes 'slime-repl-mode)
(add-to-list 'ac-modes 'html-mode)
(add-to-list 'ac-modes 'js2-mode)
;;; ac-mode
;(autoload 'ac-mode "ac-mode" "Minor mode for advanced completion." t nil)





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ウィンドウのポップアップ ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 設定したバッファをポップアップ表示する
;; "C-g"または、他のウィンドウを選択すると閉じる
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

;; slime時のポップアップを追加
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
