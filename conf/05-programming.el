;;;;;;;;;;;;
;;; 全般 ;;;
;;;;;;;;;;;;

;; 実行権限の自動付与
;; ファイルが #! から始まる場合、+X を付けて保存する
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

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

;;; マニュアルビューアの設定 ;;;

;; womanキャッシュを作成
;; C-u M-x woman RET で更新
(setq woman-cache-filename "~/.emacs.d/.wmncache.el")

;; womanにmanパスを設定
(setq woman-manpath '("/usr/share/man"
                      "/usr/local/share/man"
;                      "/usr/local/share/man/ja"))
                      "/usr/local/share/man/jp"))

;; anything-for-document用のソースを定義
;; M-x anything-for-documentでドキュメントを串刺し検索
(setq anything-for-document-sources
      (list anything-c-source-man-pages
            anything-c-source-info-cl
            anything-c-source-info-pages
            anything-c-source-info-elisp
;            anything-c-source-info-emacs
            anything-c-source-emacs-commands
            anything-c-source-emacs-functions
            anything-c-source-emacs-variables))

;; anything-for-documentコマンドを作成
(defun anything-for-document ()
  "Preconfigured `anything' for anything-for-document."
  (interactive)
  (anything anything-for-document-sources
 ;           (thing-at-point 'symbol) nil nil nil
            nil nil nil nil
            "*anything for document*"))



;;;;;;;;;;;;
;;; Perl ;;;
;;;;;;;;;;;;

;; cperl-mode
(defalias 'perl-mode 'cperl-mode)
(add-to-list 'auto-mode-alist '("\\.psgi$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.t\\'"  . cperl-mode))
(eval-after-load "cperl-mode"
  '(progn
     (cperl-set-style "PerlStyle")
     (define-key cperl-mode-map (kbd "C-m") 'newline-and-indent)
     (define-key cperl-mode-map (kbd "(") nil)
     (define-key cperl-mode-map (kbd "{") nil)
     (define-key cperl-mode-map (kbd "[") nil)
     (define-key cperl-mode-map (kbd "M-n") 'flymake-goto-next-error)
     (define-key cperl-mode-map (kbd "M-p") 'flymake-goto-prev-error)))
(custom-set-variables
 '(cperl-indent-parens-as-block t)
 '(cperl-close-paren-offset     -4))

;; perl-completion
;; (auto-install-from-emacswiki "perl-completion.el")
(autoload 'perl-completion-mode "perl-completion" nil t)
(eval-after-load "perl-completion"
  '(progn
     (defadvice flymake-start-syntax-check-process (around flymake-start-syntax-check-lib-path activate) (plcmp-with-set-perl5-lib ad-do-it))
     (define-key plcmp-mode-map (kbd "M-TAB") nil)
     (define-key plcmp-mode-map (kbd "M-C-o") 'plcmp-cmd-smart-complete)))

;; hook
(defun my-cperl-mode-hook ()
  (perl-completion-mode t)
  (flymake-mode t)
  (when (boundp 'auto-complete-mode)
    (defvar ac-source-my-perl-completion
      '((candidates . plcmp-ac-make-cands)))
    (add-to-list 'ac-sources 'ac-source-my-perl-completion)))
(add-hook 'cperl-mode-hook 'my-cperl-mode-hook)
 
;; perl tidy
;; sudo aptitude install perltidy
(defun perltidy-region ()
  "Run perltidy on the current region."
  (interactive)
  (save-excursion
    (shell-command-on-region (point) (mark) "perltidy -q" nil t)))
(defun perltidy-defun ()
  "Run perltidy on the current defun."
  (interactive)
  (save-excursion (mark-defun)
                  (perltidy-region)))
(global-set-key "\C-ct" 'perltidy-region)
(global-set-key "\C-c\C-t" 'perltidy-defun)





;;;;;;;;;;;;;;;;;;
;;; javascript ;;;
;;;;;;;;;;;;;;;;;;

;; js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js2-mode-hook
          '(lambda ()
             (setq js2-basic-offs_et 4)))





;;;;;;;;;;;;;;;;;;
;;; emacs-lisp ;;;
;;;;;;;;;;;;;;;;;;

;; emacs-lisp-modeのフック
(defun elisp-mode-hooks ()
  "lisp-mode-hooks"
  (when (require 'eldoc nil t)
    (setq eldoc-idle-delay 0.2)
    (setq eldoc-echo-area-use-multiline-p t)
    (turn-on-eldoc-mode)))
(add-hook 'emacs-lisp-mode-hook 'elisp-mode-hooks)

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
(add-hook 'slime-repl-mode-hook 'enable-paredit-mode)

;;; eldocの設定
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(setq eldoc-idle-delay 0.2)
(setq eldoc-minor-mode-string "")





;;;;;;;;;;;;
;;; yaml ;;;
;;;;;;;;;;;;

;; yaml-mode
(when (require 'yaml-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode)))
