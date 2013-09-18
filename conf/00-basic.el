;;; キーワードのカラー表示を有効化
(global-font-lock-mode t)

;;; 起動画面の非表示
(setq inhibit-startup-message t)

;;; 警告音なし
(setq ring-bell-function 'ignore)

;;; バックアップファイルを作らない
(setq make-backup-files nil)
(setq auto-save-default nil)

;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;;; 選択範囲（リージョン）をハイライト
(transient-mark-mode 1)

;;; 対応する括弧をハイライト
(setq show-paren-delay 0)
(show-paren-mode 1)
(setq show-paren-style 'mixed)

;;; 1行ずつスクロール
(setq scroll-step 1)

;;; タブの代わりにスペースを使う
(setq-default tab-width 4 indent-tabs-mode nil)

;;; "yes or no"の代わりに"y or n"を使用
(fset 'yes-or-no-p 'y-or-n-p)

;;; 履歴を次回emacs起動畤にも保存する
(savehist-mode 1)

;;; evalした結果を全部表示
(setq eval-expression-print-length nil)

;;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;;; 履歴数を大きくする
(setq history-length t)

;;; ミニバッファの履歴を保存する
(savehist-mode 1)

;;; キーストロークをエコーエリアに早く表示する
(setq echo-keystrokes 0.1)

;;; MetaキーをAltからCmdへ変更(Macのみ)
(when (eq system-type 'darwin)
  (setq ns-command-modifier (quote meta))
  (setq ns-alternate-modifier (quote super)))
