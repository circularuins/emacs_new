;;; jaspace.el を使った全角空白、タブ、改行表示モード
;;切り替えは M-x jaspace-mode-on or -off
(require 'jaspace)
(setq jaspace-alternate-jaspace-string "□")
(setq jaspace-alternate-eol-string "↓\n")
(setq jaspace-highlight-tabs t)  ; highlight tabs
;;(setq jaspace-highlight-tabs ?&gt;) ; use ^ as a tab marker

;;; ブラウザでgoogle検索
(load "google")

;;; 同じキーバインドを連打すると警告を出す
;; (require 'dont-type-twice)
;; (global-dont-type-twice t)

;;; 汽車ぽっぽ
(require 'sl)

;;; Nyanmode (*^o^*)
;; .emacs.dで "git submodule add https://github.com/TeMPOraL/nyan-mode.git ./public_repos/nyan-mode" を実行
;; (require 'nyan-mode)
;; (nyan-mode t)
;; (nyan-start-animation)

;;; tail
(require 'tail)
(setq tail-volatile nil)
(setq tail-hide-delay 100000)
(setq tail-max-size 15)

;;; gist.github.comを利用する
(require 'gist)

;;; M-x grep 検索結果を編集する
;; ack --nogroup hoge でackが使える
(require 'grep-edit)

;;; simple-hatena-mode
(require 'simple-hatena-mode)

;;; 英和・和英
(require 'text-translator)
(setq text-translator-auto-selection-func
     'text-translator-translate-by-auto-selection-enja)

;;;;この下に設定を追加しない！！
;;; 試行錯誤用ファイル
(require 'open-junk-file)
(setq open-junk-file-format "~/junk/%Y-%m-%d-%H%M%S.")
(global-set-key (kbd "C-x C-z") 'open-junk-file)
