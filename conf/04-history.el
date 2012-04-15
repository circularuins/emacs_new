;;; 最近使ったファイルを開く
(setq recentf-max-saved-items 3000)
(setq recentf-exclude '("/TAGS$" "/var/tmp/"))
(require 'recentf-ext)
(define-key global-map (kbd "C-x C-m") 'recentf-open-files)

;;; redoをできるようにする
(require 'redo+)
(global-set-key (kbd "<f9>") 'redo)
(setq undo-no-redo t)
(setq undo-limit 600000)
(setq undo-strong-limit 900000)

;;; kill-ringやミニバッファで過去に開いたファイルなどの履歴を保存する
(when (require 'session nil t)
  (setq session-initialize '(de-saveplace session keys menus places)
        session-globals-include '((kill-ring 50)
                                  (session-file-alist 500 t)
                                  (file-name-history 10000)))
  (add-hook 'after-init-hook 'session-initialize)
;; 前回閉じたときの位置にカーソルを復帰
  (setq session-undo-check -1))

;;; undoの分岐を視覚化(C-x u)
;;p,nで履歴を移動、f,bでブランチの切り替え、qで終了
(require 'undo-tree)
(global-undo-tree-mode)
