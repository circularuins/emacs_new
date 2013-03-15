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

;;; zo～～ne
(require 'zone)
(zone-when-idle 15)