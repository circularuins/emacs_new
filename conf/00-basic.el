;;; Localeに合わせた環境の設定
(set-locale-environment nil)

;;; キーワードのカラー表示を有効化
(global-font-lock-mode t)

;;; 起動画面の非表示
(setq inhibit-startup-message t)

;;; タイトルバーにファイル名を表示(GUIのみ)
(when window-system
  (setq frame-title-format(format "%%f - emacs@%s"(system-name))))

;;; 警告音なし
(setq ring-bell-function 'ignore)

;;; ツールバーを非表示
(tool-bar-mode -1)

;;; スクロールバーを非表示
(scroll-bar-mode -1)

;;; メニューバーを非表示
(menu-bar-mode -1)

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

;;; 年月日時刻の表示
;; 以下の書式に従ってモードラインに日付・時刻を表示する 
(setq display-time-string-forms 
'((format "%s/%s/%s(%s) %s:%s" 
year month day 
dayname 
24-hours minutes) 
load 
(if mail " Mail" ""))) 
;; 時間を表示 
(display-time) 
;; 時刻表示の左隣に日付を追加。 
(setq display-time-kawakami-form t) 
;; 24 時間制 
(setq display-time-24hr-format t)

;;; 履歴を次回emacs起動畤にも保存する
(savehist-mode 1)

;;; 画像ファイルをバッファ内で表示する
(auto-image-file-mode t)

;;; evalした結果を全部表示
(setq eval-expression-print-length nil)

;;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;;; 部分一致の補完機能を使う
;;; p-bでprint-bufferとか
(partial-completion-mode t)

;;; 履歴数を大きくする
(setq history-length t)

;;; ミニバッファの履歴を保存する
(savehist-mode 1)

;;; minibufferでC-wで前の単語を削除
;;(define-key minibuffer-local-completion-map "\C-w" 'backward-kill-word)

;;; 最近開いたファイルを保存する数を増やす
(setq recentf-max-saved-items 10000)

;;; diredを便利にする
(require 'dired-x)

;;; diredから"r"でファイル名をインライン編集する
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;;; ファイル名が重複していたらディレクトリ名を追加する。
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;;; キーストロークをエコーエリアに早く表示する
(setq echo-keystrokes 0.1)
