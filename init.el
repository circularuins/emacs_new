;;;;;;;;;;;;;;;;;;;;;;;;
;;; ロードパスの設定 ;;;
;;;;;;;;;;;;;;;;;;;;;;;;

;; load-pathを追加する関数（Emacs実践入門より）
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; 引数のディレクトリとサブディレクトリをload-pathに追加
(add-to-load-path "elisp" "conf" "public_repos" "elpa")





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 拡張インストールのための設定 ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; auto-install.el ;;;

(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/elisp/")
(auto-install-update-emacswiki-package-name t)
; install-elisp との互換のため
(auto-install-compatibility-setup)
; ediff関連のバッファを1つのフレームにまとめる
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;; package.el ;;;

(require 'package)
; リポジトリにMarmaladeと開発者個人のELPAを追加
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
; インストールするディレクトリを指定
(setq package-user-dir (concat user-emacs-directory "elpa"))
; インストールしたパッケージにロードパスを通してロードする
(package-initialize)

;;; 自動バイトコンパイル ;;;

(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 分割設定ファイルの読み込み ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; https://gist.github.com/zqwell/1021706
;; 分割した設定ファイルを読み込む
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf") ; 設定ファイルのディレクトリを指定
