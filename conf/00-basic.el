;;; キーワードのカラー表示を有効化
(global-font-lock-mode t)

;;; 起動画面の非表示
(setq inhibit-startup-message t)

;;; 警告音なし
(setq ring-bell-function 'ignore)

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

;;; evalした結果を全部表示
(setq eval-expression-print-length nil)

;;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;;; キーストロークをエコーエリアに早く表示する
(setq echo-keystrokes 0.1)
