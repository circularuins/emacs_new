;;; 使わないバッファを自動的に消す
;; (require 'tempbuf)
;; (add-hook 'find-file-hooks 'turn-on-tempbuf-mode)
;; (add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)

;;; 閉じたバッファもundo
(when (require 'undohist nil t)
  (undohist-initialize))

;;; 前回終了時のバッファ状態を復元
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe emacs" t)
(define-key ctl-x-map "S" 'save-current-configuration)    ; C-x S で状態保存
(define-key ctl-x-map "F" 'resume)                        ; C-x F で復元
(add-hook 'kill-emacs-hook 'save-current-configuration)   ; 終了時に状態保存

;;; *Completions*バッファを使用後に消す
(require 'lcomp)
(lcomp-mode 1)
(lcomp-keys-mode 1)

;;; iswitchb(バッファ切り替え時のインクリメンタル補完)
(iswitchb-mode 1)
(add-hook 'iswitchb-define-mode-map-hook
          (lambda ()
            (define-key iswitchb-mode-map "\C-n" 'iswitchb-next-match)
            (define-key iswitchb-mode-map "\C-p" 'iswitchb-prev-match)
            (define-key iswitchb-mode-map "\C-f" 'iswitchb-next-match)
            (define-key iswitchb-mode-map "\C-b" 'iswitchb-prev-match)))

;;; minibufでisearchを使えるようにする
(require 'minibuf-isearch nil t)

;;; バッファ一覧をタブで表示
(require 'tabbar)
;; F4 で tabbar-mode
(global-set-key [f4] 'tabbar-mode)
;; グループ化せずに*scratch*以外のタブを表示
(require 'cl)
 (when (require 'tabbar nil t)
    (setq tabbar-buffer-groups-function
            (lambda (b) (list "All Buffers")))
    (setq tabbar-buffer-list-function
          (lambda ()
            (remove-if
             (lambda(buffer)
               (find (aref (buffer-name buffer) 0) " *"))
             (buffer-list))))
    (tabbar-mode))
;; 左に表示されるボタンを無効化
(setq tabbar-home-button-enabled "")
(setq tabbar-scroll-left-button-enabled "")
(setq tabbar-scroll-right-button-enabled "")
(setq tabbar-scroll-left-button-disabled "")
(setq tabbar-scroll-right-button-disabled "")
;; 色設定
 (set-face-attribute
   'tabbar-default-face nil
   :background "gray90") ;バー自体の色
  (set-face-attribute ;非アクティブなタブ
   'tabbar-unselected-face nil
   :background "gray90"
   :foreground "black"
   :box nil)
  (set-face-attribute ;アクティブなタブ
   'tabbar-selected-face nil
   :background "black"
   :foreground "white"
   :box nil)
;; 幅設定
  (set-face-attribute
   'tabbar-separator-face nil
   :height 0.7)
;; キーバインド
(space-chord-define-global "v" 'tabbar-forward)
(space-chord-define-global "b" 'tabbar-backward)
