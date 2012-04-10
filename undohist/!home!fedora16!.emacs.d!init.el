
((digest . "fc30ec167563a5de02fae958048c668a") (undo-list nil (#("
" 0 1 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face))) . -551) (t 20347 . 1249) ((marker . 551) . -1) nil (#("
" 0 1 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face))) . -551) ((marker . 551) . -1) nil (#(";;; Localeに合わせた環境の設定
(set-locale-environment nil)

;;; 起動時のウィンドウサイズ
(setq initial-frame-alist
      (append (list
      '(width . 120)
      '(height . 45)
      '(top . 0)
      '(left . 0)
       )
      initial-frame-alist))
(setq default-frame-alist initial-frame-alist)

;;; 背景色と透明度
(if window-system (progn
  (set-background-color \"Black\")
  (set-foreground-color \"LightGray\")
  (set-cursor-color \"Gray\")
;  (set-frame-parameter nil 'alpha 70)
  ))

;;; color-themeの設定
(require 'color-theme)
(color-theme-initialize)
;;(color-theme-arjen)
;;(color-theme-euphoria)(
(color-theme-clarity)

;;; キーワードのカラー表示を有効化
(global-font-lock-mode t)

;;; 起動画面の非表示
(setq inhibit-startup-message t)

;;; タイトルバーにファイル名を表示
(setq frame-title-format(format \"%%f - emacs@%s\"(system-name)))

;;; カーソル位置の列番号を表示
(column-number-mode t)

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

;;; C-k(kill-line)で行末の改行までkill
(setq kill-whole-line 1)

;;; カーソル位置から行頭まで削除する
(defun backward-kill-line (arg)
  \"Kill chars backward until encountering the end of a line.\"
  (interactive \"p\")
  (kill-line 0))
;; C-M-kに設定
(global-set-key (kbd \"C-M-k\") 'backward-kill-line)

;;; 範囲指定していないとき、C-wで前の単語を削除
(defadvice kill-region (around kill-word-or-kill-region activate)
  (if (and (interactive-p) transient-mark-mode (not mark-active))
      (backward-kill-word 1)
    ad-do-it))
;; minibuffer用
(define-key minibuffer-local-completion-map \"\\C-w\" 'backward-kill-word)

;;; カーソル位置の単語を削除
(defun kill-word-at-point ()
  (interactive)
  (let ((char (char-to-string (char-after (point)))))
    (cond
     ((string= \" \" char) (delete-horizontal-space))
     ((string-match \"[\\t\\n -@\\[-`{-~]\" char) (kill-word 1))
     (t (forward-char) (backward-word) (kill-word 1)))))
(global-set-key \"\\M-d\" 'kill-word-at-point)

;;; ウィンドウ内のカーソル移動
(global-set-key (kbd \"C-M-h\") (lambda () (interactive) (move-to-window-line 0)))
(global-set-key (kbd \"C-M-m\") (lambda () (interactive) (move-to-window-line nil)))
(global-set-key (kbd \"C-M-l\") (lambda () (interactive) (move-to-window-line -1)))

;;; 最終行に必ず一行挿入する
;(setq require-final-newline t)

;;; 選択範囲（リージョン）をハイライト
(transient-mark-mode 1)

;;; 対応する括弧をハイライト
(setq show-paren-delay 0)
(show-paren-mode 1)
(setq show-paren-style 'mixed)

;;; C-hで直前の文字を消去
(global-set-key (kbd \"C-h\") 'delete-backward-char)

;;; C-x C-hでhelp
(global-set-key (kbd \"C-x C-h\") 'help)

;;; 1行ずつスクロール
(setq scroll-step 1)

;;; タブの代わりにスペースを使う
(setq-default tab-width 4 indent-tabs-mode nil)

;;; \"yes or no\"の代わりに\"y or n\"を使用
(fset 'yes-or-no-p 'y-or-n-p)

;;; 年月日時刻の表示
;; 以下の書式に従ってモードラインに日付・時刻を表示する 
(setq display-time-string-forms 
'((format \"%s/%s/%s(%s) %s:%s\" 
year month day 
dayname 
24-hours minutes) 
load 
(if mail \" Mail\" \"\"))) 
;; 時間を表示 
(display-time) 
;; 時刻表示の左隣に日付を追加。 
(setq display-time-kawakami-form t) 
;; 24 時間制 
(setq display-time-24hr-format t)

;;; 現在行に色をつける
;;(global-hl-line-mode 1)
;;(set-face-background 'hl-line \"darkolivegreen\")

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
;;(define-key minibuffer-local-completion-map \"\\C-w\" 'backward-kill-word)

;;; 最近開いたファイルを保存する数を増やす
(setq recentf-max-saved-items 10000)

;;; バッファ一覧をまともに
(global-set-key \"\\C-x\\C-b\" 'bs-show)

;;; diredを便利にする
(require 'dired-x)

;;; diredから\"r\"でファイル名をインライン編集する
(require 'wdired)
(define-key dired-mode-map \"r\" 'wdired-change-to-wdired-mode)

;;; ファイル名が重複していたらディレクトリ名を追加する。
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;;; キーストロークをエコーエリアに早く表示する
(setq echo-keystrokes 0.1)" 0 4 (fontified t face font-lock-comment-delimiter-face) 4 20 (fontified t face font-lock-comment-face) 20 21 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 21 49 (fontified t) 49 50 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 50 51 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 51 55 (fontified t face font-lock-comment-delimiter-face) 55 67 (fontified t face font-lock-comment-face) 67 68 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 68 93 (fontified t) 93 94 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 94 113 (fontified t) 113 114 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 114 134 (fontified t) 134 135 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 135 155 (fontified t) 155 156 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 156 172 (fontified t) 172 173 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 173 190 (fontified t) 190 191 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 191 199 (fontified t) 199 200 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 200 227 (fontified t) 227 228 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 228 274 (fontified t) 274 275 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 275 276 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 276 280 (fontified t face font-lock-comment-delimiter-face) 280 287 (fontified t face font-lock-comment-face) 287 288 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 288 289 (fontified t) 289 291 (fontified t face font-lock-keyword-face) 291 307 (fontified t) 307 312 (fontified t face font-lock-keyword-face) 312 313 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 313 337 (fontified t) 337 344 (fontified t face font-lock-string-face) 344 345 (fontified t) 345 346 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 346 370 (fontified t) 370 381 (fontified t face font-lock-string-face) 381 382 (fontified t) 382 383 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 383 403 (fontified t) 403 409 (fontified t face font-lock-string-face) 409 410 (fontified t) 410 411 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 411 414 (fontified t face font-lock-comment-delimiter-face) 414 449 (fontified t face font-lock-comment-face) 449 450 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 450 454 (fontified t) 454 455 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 455 456 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 456 460 (fontified t face font-lock-comment-delimiter-face) 460 474 (fontified t face font-lock-comment-face) 474 475 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 475 476 (fontified t) 476 483 (fontified t face font-lock-keyword-face) 483 485 (fontified t) 485 496 (fontified t face font-lock-constant-face) 496 497 (fontified t) 497 498 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 498 522 (fontified t) 522 523 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 523 525 (fontified t face font-lock-comment-delimiter-face) 525 544 (fontified t face font-lock-comment-face) 544 545 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 545 547 (fontified t face font-lock-comment-delimiter-face) 547 570 (fontified t face font-lock-comment-face) 570 571 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 571 592 (fontified t) 592 593 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 593 594 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 594 598 (fontified t face font-lock-comment-delimiter-face) 598 613 (fontified t face font-lock-comment-face) 613 614 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 614 639 (fontified t) 639 640 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 640 641 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 641 645 (fontified t face font-lock-comment-delimiter-face) 645 653 (fontified t face font-lock-comment-face) 653 654 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 654 686 (fontified t) 686 687 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 687 688 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 688 692 (fontified t face font-lock-comment-delimiter-face) 692 707 (fontified t face font-lock-comment-face) 707 708 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 708 740 (fontified t) 740 756 (fontified t face font-lock-string-face) 756 771 (fontified t) 771 772 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 772 773 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 773 777 (fontified t face font-lock-comment-delimiter-face) 777 790 (fontified t face font-lock-comment-face) 790 791 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 791 813 (fontified t) 813 814 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 814 815 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 815 819 (fontified t face font-lock-comment-delimiter-face) 819 824 (fontified t face font-lock-comment-face) 824 825 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 825 858 (fontified t) 858 859 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 859 860 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 860 864 (fontified t face font-lock-comment-delimiter-face) 864 873 (fontified t face font-lock-comment-face) 873 874 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 874 892 (fontified t) 892 893 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 893 894 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 894 898 (fontified t face font-lock-comment-delimiter-face) 898 909 (fontified t face font-lock-comment-face) 909 910 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 910 930 (fontified t) 930 931 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 931 932 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 932 936 (fontified t face font-lock-comment-delimiter-face) 936 946 (fontified t face font-lock-comment-face) 946 947 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 947 965 (fontified t) 965 966 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 966 967 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 967 971 (fontified t face font-lock-comment-delimiter-face) 971 986 (fontified t face font-lock-comment-face) 986 987 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 987 1015 (fontified t) 1015 1016 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1016 1044 (fontified t) 1044 1045 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1045 1046 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1046 1050 (fontified t face font-lock-comment-delimiter-face) 1050 1067 (fontified t face font-lock-comment-face) 1067 1068 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 1068 1099 (fontified t) 1099 1100 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1100 1101 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1101 1105 (fontified t face font-lock-comment-delimiter-face) 1105 1131 (fontified t face font-lock-comment-face) 1131 1132 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 1132 1156 (fontified t) 1156 1157 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1157 1158 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1158 1162 (fontified t face font-lock-comment-delimiter-face) 1162 1178 (fontified t face font-lock-comment-face) 1178 1179 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 1179 1180 (fontified t) 1180 1185 (fontified t face font-lock-keyword-face) 1185 1186 (fontified t) 1186 1204 (fontified t face font-lock-function-name-face) 1204 1210 (fontified t) 1210 1211 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1211 1213 (fontified t) 1213 1272 (fontified t face font-lock-doc-face) 1272 1273 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1273 1288 (fontified t) 1288 1291 (fontified t face font-lock-string-face) 1291 1292 (fontified t) 1292 1293 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1293 1309 (fontified t) 1309 1310 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1310 1313 (fontified t face font-lock-comment-delimiter-face) 1313 1321 (fontified t face font-lock-comment-face) 1321 1322 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 1322 1343 (fontified t) 1343 1350 (fontified t face font-lock-string-face) 1350 1372 (fontified t) 1372 1373 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1373 1374 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1374 1378 (fontified t face font-lock-comment-delimiter-face) 1378 1401 (fontified t face font-lock-comment-face) 1401 1402 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 1402 1403 (fontified t) 1403 1412 (fontified t face font-lock-keyword-face) 1412 1413 (fontified t) 1413 1424 (fontified t face font-lock-function-name-face) 1424 1467 (fontified t) 1467 1468 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1468 1471 (fontified t) 1471 1473 (fontified t face font-lock-keyword-face) 1473 1533 (fontified t) 1533 1534 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1534 1562 (fontified t) 1562 1563 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1563 1577 (fontified t) 1577 1578 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1578 1581 (fontified t face font-lock-comment-delimiter-face) 1581 1592 (fontified t face font-lock-comment-face) 1592 1593 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 1593 1637 (fontified t) 1637 1643 (fontified t face font-lock-string-face) 1643 1664 (fontified t) 1664 1665 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1665 1666 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1666 1670 (fontified t face font-lock-comment-delimiter-face) 1670 1682 (fontified t face font-lock-comment-face) 1682 1683 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 1683 1684 (fontified t) 1684 1689 (fontified t face font-lock-keyword-face) 1689 1690 (fontified t) 1690 1708 (fontified t face font-lock-function-name-face) 1708 1711 (fontified t) 1711 1712 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1712 1727 (fontified t) 1727 1728 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1728 1731 (fontified t) 1731 1734 (fontified t face font-lock-keyword-face) 1734 1781 (fontified t) 1781 1782 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1782 1787 (fontified t) 1787 1791 (fontified t face font-lock-keyword-face) 1791 1792 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1792 1807 (fontified t) 1807 1810 (fontified t face font-lock-string-face) 1810 1843 (fontified t) 1843 1844 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1844 1864 (fontified t) 1864 1882 (fontified t face font-lock-string-face) 1882 1903 (fontified t) 1903 1904 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1904 1960 (fontified t) 1960 1961 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 1961 1977 (fontified t) 1977 1983 (fontified t face font-lock-string-face) 1983 2004 (fontified t) 2004 2005 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2005 2006 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2006 2010 (fontified t face font-lock-comment-delimiter-face) 2010 2023 (fontified t face font-lock-comment-face) 2023 2024 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 2024 2045 (fontified t) 2045 2052 (fontified t face font-lock-string-face) 2052 2055 (fontified t) 2055 2061 (fontified t face font-lock-keyword-face) 2061 2104 (fontified t) 2104 2105 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2105 2126 (fontified t) 2126 2133 (fontified t face font-lock-string-face) 2133 2136 (fontified t) 2136 2142 (fontified t face font-lock-keyword-face) 2142 2187 (fontified t) 2187 2188 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2188 2209 (fontified t) 2209 2216 (fontified t face font-lock-string-face) 2216 2219 (fontified t) 2219 2225 (fontified t face font-lock-keyword-face) 2225 2269 (fontified t) 2269 2270 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2270 2271 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2271 2275 (fontified t face font-lock-comment-delimiter-face) 2275 2287 (fontified t face font-lock-comment-face) 2287 2288 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 2288 2289 (fontified t face font-lock-comment-delimiter-face) 2289 2319 (fontified t face font-lock-comment-face) 2319 2320 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 2320 2321 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2321 2325 (fontified t face font-lock-comment-delimiter-face) 2325 2342 (fontified t face font-lock-comment-face) 2342 2343 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 2343 2366 (fontified t) 2366 2367 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2367 2368 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2368 2372 (fontified t face font-lock-comment-delimiter-face) 2372 2384 (fontified t face font-lock-comment-face) 2384 2385 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 2385 2410 (fontified t) 2410 2411 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2411 2430 (fontified t) 2430 2431 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2431 2461 (fontified t) 2461 2462 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2462 2463 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2463 2467 (fontified t face font-lock-comment-delimiter-face) 2467 2479 (fontified t face font-lock-comment-face) 2479 2480 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 2480 2501 (fontified t) 2501 2506 (fontified t face font-lock-string-face) 2506 2530 (fontified t) 2530 2531 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2531 2532 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2532 2536 (fontified t face font-lock-comment-delimiter-face) 2536 2548 (fontified t face font-lock-comment-face) 2548 2549 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 2549 2570 (fontified t) 2570 2579 (fontified t face font-lock-string-face) 2579 2587 (fontified t) 2587 2588 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2588 2589 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2589 2593 (fontified t face font-lock-comment-delimiter-face) 2593 2602 (fontified t face font-lock-comment-face) 2602 2603 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 2603 2623 (fontified t) 2623 2624 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2624 2625 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2625 2629 (fontified t face font-lock-comment-delimiter-face) 2629 2643 (fontified t face font-lock-comment-face) 2643 2644 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 2644 2691 (fontified t) 2691 2692 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2692 2693 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2693 2697 (fontified t face font-lock-comment-delimiter-face) 2697 2724 (fontified t face font-lock-comment-face) 2724 2725 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 2725 2754 (fontified t) 2754 2755 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2755 2756 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2756 2760 (fontified t face font-lock-comment-delimiter-face) 2760 2768 (fontified t face font-lock-comment-face) 2768 2769 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 2769 2772 (fontified t face font-lock-comment-delimiter-face) 2772 2798 (fontified t face font-lock-comment-face) 2798 2799 (fontified t face (font-lock-comment-face default default)) 2799 2800 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 2800 2831 (fontified t) 2831 2832 (fontified t face (default default)) 2832 2833 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2833 2843 (fontified t) 2843 2863 (fontified t face font-lock-string-face) 2863 2864 (fontified t face (default default)) 2864 2865 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2865 2879 (fontified t) 2879 2880 (fontified t face (default default)) 2880 2881 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2881 2888 (fontified t) 2888 2889 (fontified t face (default default)) 2889 2890 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2890 2907 (fontified t) 2907 2908 (fontified t face (default default)) 2908 2909 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2909 2913 (fontified t) 2913 2914 (fontified t face (default default)) 2914 2915 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2915 2916 (fontified t) 2916 2918 (fontified t face font-lock-keyword-face) 2918 2924 (fontified t) 2924 2931 (fontified t face font-lock-string-face) 2931 2932 (fontified t) 2932 2934 (fontified t face font-lock-string-face) 2934 2937 (fontified t) 2937 2938 (fontified t face (default default)) 2938 2939 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2939 2942 (fontified t face font-lock-comment-delimiter-face) 2942 2947 (fontified t face font-lock-comment-face) 2947 2948 (fontified t face (font-lock-comment-face default default)) 2948 2949 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 2949 2963 (fontified t) 2963 2964 (fontified t face (default default)) 2964 2965 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 2965 2968 (fontified t face font-lock-comment-delimiter-face) 2968 2982 (fontified t face font-lock-comment-face) 2982 2983 (fontified t face (font-lock-comment-face default default)) 2983 2984 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 2984 3019 (fontified t) 3019 3020 (fontified t face (default default)) 3020 3021 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3021 3024 (fontified t face font-lock-comment-delimiter-face) 3024 3030 (fontified t face font-lock-comment-face) 3030 3031 (fontified t face (font-lock-comment-face default default)) 3031 3032 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 3032 3065 (fontified t) 3065 3066 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3066 3067 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3067 3071 (fontified t face font-lock-comment-delimiter-face) 3071 3080 (fontified t face font-lock-comment-face) 3080 3081 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 3081 3083 (fontified t face font-lock-comment-delimiter-face) 3083 3106 (fontified t face font-lock-comment-face) 3106 3107 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 3107 3109 (fontified t face font-lock-comment-delimiter-face) 3109 3156 (fontified t face font-lock-comment-face) 3156 3157 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 3157 3158 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3158 3162 (fontified t face font-lock-comment-delimiter-face) 3162 3181 (fontified t face font-lock-comment-face) 3181 3182 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 3182 3199 (fontified t) 3199 3200 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3200 3201 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3201 3205 (fontified t face font-lock-comment-delimiter-face) 3205 3222 (fontified t face font-lock-comment-face) 3222 3223 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 3223 3247 (fontified t) 3247 3248 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3248 3249 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3249 3253 (fontified t face font-lock-comment-delimiter-face) 3253 3266 (fontified t face font-lock-comment-face) 3266 3267 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 3267 3306 (fontified t) 3306 3307 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3307 3308 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3308 3312 (fontified t face font-lock-comment-delimiter-face) 3312 3328 (fontified t face font-lock-comment-face) 3328 3329 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 3329 3360 (fontified t) 3360 3361 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3361 3407 (fontified t) 3407 3408 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3408 3409 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3409 3413 (fontified t face font-lock-comment-delimiter-face) 3413 3425 (fontified t face font-lock-comment-face) 3425 3426 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 3426 3430 (fontified t face font-lock-comment-delimiter-face) 3430 3448 (fontified t face font-lock-comment-face) 3448 3449 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 3449 3476 (fontified t) 3476 3477 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3477 3478 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3478 3482 (fontified t face font-lock-comment-delimiter-face) 3482 3491 (fontified t face font-lock-comment-face) 3491 3492 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 3492 3515 (fontified t) 3515 3516 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3516 3517 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3517 3521 (fontified t face font-lock-comment-delimiter-face) 3521 3535 (fontified t face font-lock-comment-face) 3535 3536 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 3536 3553 (fontified t) 3553 3554 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3554 3555 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3555 3559 (fontified t face font-lock-comment-delimiter-face) 3559 3581 (fontified t face font-lock-comment-face) 3581 3582 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 3582 3584 (fontified t face font-lock-comment-delimiter-face) 3584 3655 (fontified t face font-lock-comment-face) 3655 3656 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 3656 3657 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3657 3661 (fontified t face font-lock-comment-delimiter-face) 3661 3680 (fontified t face font-lock-comment-face) 3680 3681 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 3681 3717 (fontified t) 3717 3718 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3718 3719 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3719 3723 (fontified t face font-lock-comment-delimiter-face) 3723 3734 (fontified t face font-lock-comment-face) 3734 3735 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 3735 3751 (fontified t) 3751 3761 (fontified t face font-lock-string-face) 3761 3771 (fontified t) 3771 3772 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3772 3773 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3773 3777 (fontified t face font-lock-comment-delimiter-face) 3777 3788 (fontified t face font-lock-comment-face) 3788 3789 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 3789 3790 (fontified t) 3790 3797 (fontified t face font-lock-keyword-face) 3797 3799 (fontified t) 3799 3806 (fontified t face font-lock-constant-face) 3806 3807 (fontified t) 3807 3808 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3808 3809 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3809 3813 (fontified t face font-lock-comment-delimiter-face) 3813 3839 (fontified t face font-lock-comment-face) 3839 3840 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 3840 3841 (fontified t) 3841 3848 (fontified t face font-lock-keyword-face) 3848 3850 (fontified t) 3850 3856 (fontified t face font-lock-constant-face) 3856 3857 (fontified t) 3857 3858 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3858 3885 (fontified t) 3885 3888 (fontified t face font-lock-string-face) 3888 3919 (fontified t) 3919 3920 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3920 3921 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3921 3925 (fontified t face font-lock-comment-delimiter-face) 3925 3951 (fontified t face font-lock-comment-face) 3951 3952 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 3952 3953 (fontified t) 3953 3960 (fontified t face font-lock-keyword-face) 3960 3962 (fontified t) 3962 3970 (fontified t face font-lock-constant-face) 3970 3971 (fontified t) 3971 3972 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 3972 4034 (fontified t) 4034 4035 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 4035 4036 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face)) 4036 4040 (fontified t face font-lock-comment-delimiter-face) 4040 4061 (fontified t face font-lock-comment-face) 4061 4062 (fontified t face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face)) 4062 4088 (fontified t)) . -552) (t 20346 . 54831) ((marker . 1) . -3157) ((marker*) . 1) ((marker) . -4088) ((marker*) . 26) ((marker) . -4063) nil (#(";; ;;; ロードパスの追加
;; (setq load-path (append
;;                  '(\"~/.emacs.d\"
;;                    \"~/.emacs.d/packages\"
;;                    \"~/.emacs.d/packages/navi2ch\"
;;                    \"~/.emacs.d/packages/twittering\"
;;                    \"~/.emacs.d/packages/mew\"
;;                    \"~/.emacs.d/packages/slime\"
;;                    \"~/.emacs.d/packages/slime/contrib\")
;;                  load-path))

" 0 3 (face font-lock-comment-delimiter-face fontified t) 3 15 (face font-lock-comment-face fontified t) 15 16 (face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face) fontified t) 16 19 (face font-lock-comment-delimiter-face fontified t) 19 42 (face font-lock-comment-face fontified t) 42 43 (face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face) fontified t) 43 63 (face font-lock-comment-delimiter-face fontified t) 63 77 (face font-lock-comment-face fontified t) 77 78 (face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face) fontified t) 78 100 (face font-lock-comment-delimiter-face fontified t) 100 121 (face font-lock-comment-face fontified t) 121 122 (face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face) fontified t) 122 144 (face font-lock-comment-delimiter-face fontified t) 144 173 (face font-lock-comment-face fontified t) 173 174 (face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face) fontified t) 174 196 (face font-lock-comment-delimiter-face fontified t) 196 228 (face font-lock-comment-face fontified t) 228 229 (face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face) fontified t) 229 251 (face font-lock-comment-delimiter-face fontified t) 251 276 (face font-lock-comment-face fontified t) 276 277 (face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face) fontified t) 277 299 (face font-lock-comment-delimiter-face fontified t) 299 326 (face font-lock-comment-face fontified t) 326 327 (face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face) fontified t) 327 349 (face font-lock-comment-delimiter-face fontified t) 349 385 (face font-lock-comment-face fontified t) 385 386 (face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face) fontified t) 386 406 (face font-lock-comment-delimiter-face fontified t) 406 417 (face font-lock-comment-face fontified t) 417 418 (face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face) fontified t) 418 419 (face (jaspace-highlight-eol-face jaspace-highlight-eol-face) fontified t)) . -1) (t 20346 . 54819) nil (#("
;; ;;; 標準Elispの設定
;; (load \"config/builtins\")

;; ;;; 非標準Elispの設定
;; (load \"config/packages\")

;; ;;; eshellの設定
;; (load \"config/shellconf\")

;; ;;; 外部依存プログラムの設定
;; (load \"config/exdependencies\")
" 0 1 (face (jaspace-highlight-eol-face jaspace-highlight-eol-face) fontified t) 1 4 (face font-lock-comment-delimiter-face fontified t) 4 18 (face font-lock-comment-face fontified t) 18 19 (face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face) fontified t) 19 22 (face font-lock-comment-delimiter-face fontified t) 22 46 (face font-lock-comment-face fontified t) 46 47 (face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face) fontified t) 47 48 (face (jaspace-highlight-eol-face jaspace-highlight-eol-face) fontified t) 48 51 (face font-lock-comment-delimiter-face fontified t) 51 66 (face font-lock-comment-face fontified t) 66 67 (face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face) fontified t) 67 70 (face font-lock-comment-delimiter-face fontified t) 70 94 (face font-lock-comment-face fontified t) 94 95 (face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face) fontified t) 95 96 (face (jaspace-highlight-eol-face jaspace-highlight-eol-face) fontified t) 96 99 (face font-lock-comment-delimiter-face fontified t) 99 112 (face font-lock-comment-face fontified t) 112 113 (face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face) fontified t) 113 116 (face font-lock-comment-delimiter-face fontified t) 116 141 (face font-lock-comment-face fontified t) 141 142 (face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face) fontified t) 142 143 (face (jaspace-highlight-eol-face jaspace-highlight-eol-face) fontified t) 143 146 (face font-lock-comment-delimiter-face fontified t) 146 162 (face font-lock-comment-face fontified t) 162 163 (face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face) fontified t) 163 166 (face font-lock-comment-delimiter-face fontified t) 166 196 (face font-lock-comment-face fontified t) 196 197 (face (jaspace-highlight-eol-face jaspace-highlight-eol-face font-lock-comment-face) fontified t)) . -5060) (t 20346 . 52616) nil (5223 . 5226) (5203 . 5206) (5173 . 5176) (5156 . 5159) (5127 . 5130) (5108 . 5111) (5079 . 5082) (5061 . 5064) 5233 (t 20346 . 52555) nil (387 . 390) (328 . 331) (278 . 281) (230 . 233) (175 . 178) (123 . 126) (79 . 82) (44 . 47) (17 . 20) (1 . 4) 388 (t 20346 . 52537) nil (927 . 937) nil (#("c" 0 1 (fontified t face font-lock-string-face)) . -927) nil (#("a" 0 1 (fontified t face font-lock-string-face)) . -928) nil (#("." 0 1 (fontified t face font-lock-string-face)) . -929) nil (#("d" 0 1 (fontified t face font-lock-string-face)) . -930) nil (927 . 931) nil (922 . 927) nil (921 . 923) nil (915 . 921) nil (904 . 915) (#("ini" 0 3 (fontified t)) . -904) nil (904 . 907) nil (903 . 905) nil (902 . 903) nil (888 . 901) nil (881 . 888) (#("requ" 0 4 (fontified t)) . -881) nil (881 . 885) nil (880 . 882) nil (879 . 880) nil (863 . 879) nil (862 . 863) nil (861 . 862) nil (860 . 861) nil (860 . 861) nil (859 . 860) (t 20345 . 49658) nil (852 . 856) nil (851 . 853) nil (850 . 851) (837 . 849) nil (836 . 838) nil (835 . 836) (830 . 834) nil (829 . 831) nil (828 . 829) (822 . 827) nil (821 . 823) nil (820 . 821) nil (804 . 820) (#("add" 0 3 (fontified t)) . -804) nil (804 . 807) nil (803 . 805) nil (802 . 803) nil (799 . 802) nil (790 . 799) (#("load-" 0 5 (face font-lock-comment-face fontified t)) . -790) nil (789 . 795) nil (788 . 789) nil (787 . 788) nil (786 . 787) nil (786 . 787) nil (785 . 786) (t 20324 . 38840) nil (737 . 778) (#("no" 0 2 (fontified t)) . -737) nil (737 . 739) nil (736 . 738) nil (723 . 736) nil (712 . 722) nil (692 . 712) nil (672 . 692) nil (671 . 673) nil (668 . 671) nil (667 . 669) nil (658 . 667) nil (640 . 657) (#("defa" 0 4 (fontified t)) . -640) nil (639 . 644) nil (630 . 639) (#("load-" 0 5 (fontified t)) . -630) nil (617 . 635) nil (616 . 618) nil (607 . 616) nil (591 . 603) nil (571 . 591) nil (570 . 572) nil (553 . 570) nil (552 . 554) nil (537 . 552) nil (520 . 537) nil (519 . 521) nil (518 . 520) nil (514 . 518) nil (513 . 515) nil (506 . 513) nil (496 . 505) nil (#("h" 0 1 (fontified t)) . -496) nil (489 . 497) nil (488 . 490) nil (481 . 488) nil (480 . 482) nil (475 . 480)))
