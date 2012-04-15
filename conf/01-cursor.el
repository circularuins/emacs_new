;;; C-hで直前の文字を消去
(global-set-key (kbd "C-h") 'delete-backward-char)

;;; C-x C-hでhelp
(global-set-key (kbd "C-x C-h") 'help)

;;; カーソル位置から行頭まで削除する
(defun backward-kill-line (arg)
  "Kill chars backward until encountering the end of a line."
  (interactive "p")
  (kill-line 0))
;; C-M-kに設定
(global-set-key (kbd "C-M-k") 'backward-kill-line)

;;; 範囲指定していないとき、C-wで前の単語を削除
(defadvice kill-region (around kill-word-or-kill-region activate)
  (if (and (interactive-p) transient-mark-mode (not mark-active))
      (backward-kill-word 1)
    ad-do-it))
;; minibuffer用
(define-key minibuffer-local-completion-map "\C-w" 'backward-kill-word)

;;; カーソル位置の単語を削除
(defun kill-word-at-point ()
  (interactive)
  (let ((char (char-to-string (char-after (point)))))
    (cond
     ((string= " " char) (delete-horizontal-space))
     ((string-match "[\t\n -@\[-`{-~]" char) (kill-word 1))
     (t (forward-char) (backward-word) (kill-word 1)))))
(global-set-key "\M-d" 'kill-word-at-point)

;;; ウィンドウ内のカーソル移動
(global-set-key (kbd "C-M-h") (lambda () (interactive) (move-to-window-line 0)))
(global-set-key (kbd "C-M-m") (lambda () (interactive) (move-to-window-line nil)))
(global-set-key (kbd "C-M-l") (lambda () (interactive) (move-to-window-line -1)))

;;; バッファ一覧をまともに
(global-set-key "\C-x\C-b" 'bs-show)

;;; 最後の変更箇所にジャンプする
(require 'goto-chg)
(define-key global-map (kbd "<f8>") 'goto-last-change)
(define-key global-map (kbd "S-<f8>") 'goto-last-change-reverse)

;;; カーソル位置を戻す
(require 'point-undo)
(define-key global-map (kbd "<f7>") 'point-undo)
(define-key global-map (kbd "S-<f7>") 'point-redo)

;;; カーソル位置に目に見える印をつける
;; (setq-default bm-buffer-persistence nil)
;; (setq bm-restore-repository-on-load t)
;; (require 'bm)
;; (add-hook 'find-file-hooks 'bm-buffer-restore)
;; (add-hook 'kill-buffer-hook 'bm-buffer-save)
;; (add-hook 'after-save-hook 'bm-buffer-save)
;; (add-hook 'after-revert-hook 'bm-buffer-restore)
;; (add-hook 'vc-before-checkin-hook 'bm-buffer-save)
;; (global-set-key (kbd "M-SPC") 'bm-toggle)
;; (global-set-key (kbd "M-[") 'bm-previous)
;; (global-set-key (kbd "M-]") 'bm-next)

;;; 相対的なカーソル位置を保ったままスクロール
(setq scroll-preserve-screen-position t)

;;; 現在行・桁のハイライト
;; (require 'crosshairs)
;; (global-set-key (kbd "C-c h") 'crosshairs-mode)

;;; 現在位置のファイル・URLを開く
(ffap-bindings)

;;; キーボード同時押しコマンドの設定
(require 'key-chord)
(setq key-chord-two-keys-delay 0.04)
(key-chord-mode 1)
(require 'space-chord)
