;;; auto-installの設定
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/elisp/")
(auto-install-update-emacswiki-package-name t)
;;install-elisp との互換のため
(auto-install-compatibility-setup)
;; ediff関連のバッファを1つのフレームにまとめる
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;; 自動バイトコンパイル
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;;; multi-termの設定
(require 'multi-term)
(setq multi-term-program shell-file-name)
(add-to-list 'term-unbind-key-list '"M-x")
(add-hook 'term-mode-hook
          '(lambda ()
             ;; C-h を term 内文字削除にする
             (define-key term-raw-map (kbd "C-h") 'term-send-backspace)
             ;; C-y を term 内ペーストにする
             (define-key term-raw-map (kbd "C-y") 'term-paste)
             ))
(global-set-key (kbd "C-c t") '(lambda ()
                                 (interactive)
                                 (if (get-buffer "*terminal<1>*")
                                     (switch-to-buffer "*terminal<1>*")
                                   (multi-term))))
(global-set-key (kbd "C-c n") 'multi-term-next)
(global-set-key (kbd "C-c p") 'multi-term-prev)


;;; jaspace.el を使った全角空白、タブ、改行表示モード
;;切り替えは M-x jaspace-mode-on or -off
(require 'jaspace)
(setq jaspace-alternate-jaspace-string "□")
(setq jaspace-alternate-eol-string "↓\n")
(setq jaspace-highlight-tabs t)  ; highlight tabs
;;(setq jaspace-highlight-tabs ?&gt;) ; use ^ as a tab marker


;;; perltidy
;;http://polog.org/archives/2007/06/17004132.phpを参考にperltidyをインストールしておく
(require 'perltidy)

;;; ブラウザでgoogle検索
(load "google")

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

;;; 使わないバッファを自動的に消す
;; (require 'tempbuf)
;; (add-hook 'find-file-hooks 'turn-on-tempbuf-mode)
;; (add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)

;;; キーボード同時押しコマンドの設定
(require 'key-chord)
(setq key-chord-two-keys-delay 0.04)
(key-chord-mode 1)
(require 'space-chord)

;;; anythingの設定
;;(require 'anything-startup)
(require 'anything)
(require 'anything-config)
(key-chord-define-global "zx"
;(define-key global-map (kbd "M-x")
  (lambda ()
    "Execute emacs commands in anything"
    (interactive)
    (anything '(anything-c-source-emacs-commands))))

;;; anythingフレームワークでフォントを確認する
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

;;; 現在行・桁のハイライト
(require 'crosshairs)
(global-set-key (kbd "C-c h") 'crosshairs-mode)

;;; 閉じたバッファもundo
(when (require 'undohist nil t)
  (undohist-initialize))

;;; 最近使ったファイルを開く
(setq recentf-max-saved-items 3000)
(setq recentf-exclude '("/TAGS$" "/var/tmp/"))
(require 'recentf-ext)
(define-key global-map (kbd "C-x C-m") 'recentf-open-files)

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

;;; redoをできるようにする
(require 'redo+)
(global-set-key (kbd "<f9>") 'redo)
(setq undo-no-redo t)
(setq undo-limit 600000)
(setq undo-strong-limit 900000)

;;; 同じキーバインドを連打すると警告を出す
;; (require 'dont-type-twice)
;; (global-dont-type-twice t)

;;; js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js2-mode-hook
          '(lambda ()
             (setq js2-basic-offs_et 4)))

;;; 汽車ぽっぽ
(require 'sl)

;;; Nyanmode (*^o^*)
;; .emacs.dで "git submodule add https://github.com/TeMPOraL/nyan-mode.git ./public_repos/nyan-mode" を実行
(require 'nyan-mode)
(nyan-mode t)
(nyan-start-animation)

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

;;; tail
(require 'tail)
(setq tail-volatile nil)
(setq tail-hide-delay 100000)
(setq tail-max-size 15)

;;; kill-ringやミニバッファで過去に開いたファイルなどの履歴を保存する
(when (require 'session nil t)
  (setq session-initialize '(de-saveplace session keys menus places)
        session-globals-include '((kill-ring 50)
                                  (session-file-alist 500 t)
                                  (file-name-history 10000)))
  (add-hook 'after-init-hook 'session-initialize)
;; 前回閉じたときの位置にカーソルを復帰
  (setq session-undo-check -1))

;;; minibufでisearchを使えるようにする
(require 'minibuf-isearch nil t)

; shell-pop の設定
(require 'shell-pop)
(key-chord-define-global "qw" 'shell-pop)
(shell-pop-set-internal-mode "eshell")
;(shell-pop-set-internal-mode-shell "/bin/zsh")
(shell-pop-set-window-height 60)

;;; marmalade
(require 'package)
;;リポジトリにMarmaladeを追加
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;;インストールするディレクトリを指定
(setq package-user-dir (concat user-emacs-directory "elpa"))
;;インストールしたパッケージにロードパスを通してロードする
(package-initialize)

;;; 式の評価結果を注釈するための設定
(require 'lispxmp)
;; emacs-lisp-modeでC-c C-dを押すと注釈される
(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)
(add-to-list 'ac-modes 'emacs-lisp-mode)

;;; 括弧の対応を保持して編集する設定
(require 'paredit)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook 'enable-paredit-mode)

;;; eldocの設定
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(setq eldoc-idle-delay 0.2)
(setq eldoc-minor-mode-string "")

;;; undoの分岐を視覚化(C-x u)
;;p,nで履歴を移動、f,bでブランチの切り替え、qで終了
(require 'undo-tree)
(global-undo-tree-mode)

;;; gist.github.comを利用する
(require 'gist)

;;; M-x grep 検索結果を編集する
;; ack --nogroup hoge でackが使える
(require 'grep-edit)

;;; ヘルプを綺麗に表示する
(require 'pos-tip)
(defun my-describe-function (function)
   "Display the full documentation of FUNCTION (a symbol) in tooltip."
   (interactive (list (function-called-at-point)))
   (if (null function)
       (pos-tip-show
        "** You didn't specify a function! **" '("red"))
     (pos-tip-show
      (with-temp-buffer
        (let ((standard-output (current-buffer))
              (help-xref-following t))
          (prin1 function)
          (princ " is ")
          (describe-function-1 function)
          (buffer-string)))
      nil nil nil 0)))
 (define-key emacs-lisp-mode-map (kbd "C-;") 'my-describe-function)

;;; e2wm 設定(終了する場合は「C-c ; Q」)
(require 'e2wm)
(global-set-key (kbd "M-+") 'e2wm:start-management)
(e2wm:add-keymap 
 e2wm:pst-minor-mode-keymap
 '(("<M-left>" . e2wm:dp-code ) ; codeへ変更
   ("<M-right>"  . e2wm:dp-two) ; twoへ変更
   ("<M-up>"    . e2wm:dp-doc)  ; docへ変更
   ("<M-down>"  . e2wm:dp-dashboard) ; dashboardへ変更
   ("C-."       . e2wm:pst-history-forward-command) ; 履歴進む
   ("C-,"       . e2wm:pst-history-back-command) ; 履歴戻る
   ("C-M-s"     . e2wm:my-toggle-sub) ; subの表示をトグルする
   ("prefix L"  . ielm) ; ielm を起動する（subで起動する）
   ("M-m"       . e2wm:pst-window-select-main-command) ; メインウインドウを選択する
   ) e2wm:prefix-key)
(e2wm:add-keymap 
 e2wm:dp-doc-minor-mode-map 
 '(("prefix I" . info)) ; infoを起動する
 e2wm:prefix-key)
(defun e2wm:my-toggle-sub () ; Subをトグルする関数
  (interactive)
  (e2wm:pst-window-toggle 'sub t 'main))

;;;;この下に設定を追加しない！！
;;; 試行錯誤用ファイル
(require 'open-junk-file)
(setq open-junk-file-format "~/junk/%Y-%m-%d-%H%M%S.")
(global-set-key (kbd "C-x C-z") 'open-junk-file)
