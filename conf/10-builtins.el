;;; サーバーemacsclientとして開く
;; ~/bashrcに export EDITOR=emacsclient export VISUAL=emacsclient を追加しておく
(server-start)
(defun iconify-emacs-when-server-is-done ()
  (unless server-clients (iconify-frame)))
;; 編集が終了したらEmacsをアイコン化する
(add-hook 'server-done-hook 'iconify-emacs-when-server-is-done)
;; C-x C-cに割り当てる
(global-set-key (kbd "C-x C-c") 'server-edit)
;; M-x exitでemacsを終了出来るようにする
(defalias 'exit 'save-buffers-kill-emacs)

;;; 現在位置のファイル・URLを開く
(ffap-bindings)

;;;フルスクリーンモードの切り替え
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                           'fullboth)))
(global-set-key [(meta return)] 'toggle-fullscreen)

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

;;; cperl-modeの設定
(defalias 'perl-mode 'cperl-mode)
(add-hook 'cperl-mode-hook
          '(lambda ()
             (cperl-set-style "PerlStyle")))

;;; iswitchb(バッファ切り替え時のインクリメンタル補完)
(iswitchb-mode 1)
(add-hook 'iswitchb-define-mode-map-hook
          (lambda ()
            (define-key iswitchb-mode-map "\C-n" 'iswitchb-next-match)
            (define-key iswitchb-mode-map "\C-p" 'iswitchb-prev-match)
            (define-key iswitchb-mode-map "\C-f" 'iswitchb-next-match)
            (define-key iswitchb-mode-map "\C-b" 'iswitchb-prev-match)))

;; org-mode
;; Emacsでメモ・TODO管理
(require 'org-install)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cr" 'org-remember)
(setq org-startup-truncated nil)
(setq org-return-follows-link t)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(org-remember-insinuate)
(setq org-directory "~/memo/")
(setq org-default-notes-file (concat org-directory "notes.org"))
(setq org-agenda-files '("~/memo/notes.org"))
(setq org-remember-templates
      '(("Todo" ?t "** TODO %?\n   %i\n   %a\n   %t" nil "Inbox")
        ("Bug" ?b "** TODO %?   :bug:\n   %i\n   %a\n   %t" nil "Inbox")
        ("Idea" ?i "** %?\n   %i\n   %a\n   %t" nil "New Ideas")))

;;; フィードの登録
(setq newsticker-url-list
      '((“Slashdot” “http://rss.slashdot.org/Slashdot/slashdot”)
        (“TechCrunch” “http://feeds.feedburner.com/TechCrunch”)))

;;; wdired("C-x d" -> "C-x C-q")で、ファイルのパーミションを編集可能にする
(setq wdired-allow-to-change-permissions t)

;;; iimage-modeでホームディレクトリを展開
(setq iimage-mode-image-filename-regex
     (concat "[-~+./_0-9a-zA-Z]+\\."
             (regexp-opt (nconc (mapcar #'upcase
                                        image-file-name-extensions)
                                image-file-name-extensions))))
;; C-lC-lを再描画に設定
(setq iimage-mode-map (make-sparse-keymap))
(define-key iimage-mode-map "\C-l" nil)
(define-key iimage-mode-map "\C-l\C-l" 'iimage-recenter)
;; 5秒何もしなければ再描画
(run-with-idle-timer 5 5 (lambda () (and iimage-mode (iimage-recenter))))
;; テキストモードでiimage-modeをon
(add-hook 'text-mode-hook 'turn-on-iimage-mode)

;;; ファイルが #! から始まる場合、+X を付けて保存する
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;;; emacs-lisp-modeのフック
(defun elisp-mode-hooks ()
  "lisp-mode-hooks"
  (when (require 'eldoc nil t)
    (setq eldoc-idle-delay 0.2)
    (setq eldoc-echo-area-use-multiline-p t)
    (turn-on-eldoc-mode)))
(add-hook 'emacs-lisp-mode-hook 'elisp-mode-hooks)
