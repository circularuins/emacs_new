;;; slime(lisp-mode)の設定
;;(setq inferior-lisp-program "clisp")    ; clisp用
(setq inferior-lisp-program "sbcl")     ; sbcl用
(require 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner))
(setq slime-net-coding-system 'utf-8-unix)
;;lispの補完(auto-completeの拡張版)
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
;;lispのインデント
(when (require 'cl-indent-patches nil t)
  ;; emacs-lispのインデントと混同しないように
  (setq lisp-indent-function
        (lambda (&rest args)
          (apply (if (memq major-mode '(emacs-lisp-mode lisp-interaction-mode))
                     'lisp-indent-function
                     'common-lisp-indent-function)
                 args))))
;; HyperSpecを読み込む.
(setq common-lisp-hyperspec-root
      (concat "file://" (expand-file-name "~/.emacs.d/doc/hyperspec/HyperSpec/"))
      common-lisp-hyperspec-symbol-table
      (expand-file-name "~/.emacs.d/doc/hyperspec/HyperSpec/Data/Map_Sym.txt"))
;; カーソル付近にある単語の情報を表示
(slime-autodoc-mode)

;;; emacs-w3m
;;(require 'w3m-load)

;;; twitter
(require 'twittering-mode)
(setq twittering-allow-insecure-server-cert t)
(setq twittering-use-master-password t)
(setq twittering-icon-mode t)
(setq twittering-jojo-mode t)
(defun twittering-mode-hook-func ()
  (set-face-bold-p 'twittering-username-face t)
  (set-face-foreground 'twittering-username-face "DeepSkyBlue3")
  (set-face-foreground 'twittering-uri-face "gray35")
  (define-key twittering-mode-map (kbd "<") 'my-beginning-of-buffer)
  (define-key twittering-mode-map (kbd ">") 'my-end-of-buffer)
  (define-key twittering-mode-map (kbd "F") 'twittering-favorite))
(add-hook 'twittering-mode-hook 'twittering-mode-hook-func)

;;; 2ch
(require 'navi2ch)
(setq navi-2ch-article-exist-message-range '(1 . 1000) )
(setq navi-2ch-article-new-message-range '(1000. 1))
(setq navi-2ch-board-insert-subject-with-diff t)
(setq navi-2ch-board-insert-subject-with-unread t)
(setq navi-2ch-list-init-open-category t)
(setq navi-2ch-board-expire-date nil)
(setq navi-2ch-history-max-line nil)

;; ;;; mewの設定
;; (autoload 'mew "mew" nil t)
;; (autoload 'mew-send "mew" nil t)
;; ;; Optional setup (Read Mail menu):
;; (setq read-mail-command 'mew)
;; ;; Optional setup (e.g. C-xm for sending a message):
;; (autoload 'mew-user-agent-compose "mew" nil t)
;; (if (boundp 'mail-user-agent)
;;     (setq mail-user-agent 'mew-user-agent))
;; (if (fboundp 'define-mail-user-agent)
;;     (define-mail-user-agent
;;       'mew-user-agent
;;       'mew-user-agent-compose
;;       'mew-draft-send-message
;;       'mew-draft-kill
;;       'mew-send-hook))
;; ;; mew の gmail設定
;; (defun mew-gmail-config (config account name)
;;  `(,config
;;    ("pop-ssl"      . t)
;;    ("pop-auth"    . pass)
;;    ("pop-ssl-port" . "995")
;;    ("inbox-folder" . ,(format "+%s" account))
;;    ("name"        . ,name)
;;    ("user"        . ,account)
;;    ("mail-domain" . "gmail.com")
;;    ("pop-user"    . ,(format "%s@gmail.com" account))
;;    ("pop-server"  . "pop.gmail.com")
;;    ;; 証明書がインストールされているディレクトリ
;;    ("ssl-cert-directory" . "/etc/ssl/certs")
;;    ;; 証明書がインストールされていないときは以下のコメントを外す
;;    ("ssl-verify-level" . 0)
;;    ("smtp-ssl"     . t)
;;    ("smtp-ssl-port" . "465")
;;    ("smtp-user"    . ,(format "%s@gmail.com" account))
;;    ("smtp-server" . "smtp.gmail.com")))
;; ;;; example@gmail.comの場合
;; (setq mew-config-alist
;;      (list (mew-gmail-config 'default "natsuhiko.wake" "Natsuhiko Wake")))
