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
  (set-background-color "Black")
  (set-foreground-color "LightGray")
  (set-cursor-color "Gray")
;  (set-frame-parameter nil 'alpha 70)
  ))

;;; color-themeの設定
(require 'color-theme)
(color-theme-initialize)
;;(color-theme-arjen)
;;(color-theme-euphoria)(
(color-theme-clarity)

;;;フルスクリーンモードの切り替え
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                           'fullboth)))
(global-set-key [(meta return)] 'toggle-fullscreen)

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

;;; 矢印キーでウィンドウ移動
(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))
(global-set-key (kbd "C-c <left>")  'windmove-left)
    (global-set-key (kbd "C-c <right>") 'windmove-right)
    (global-set-key (kbd "C-c <up>")    'windmove-up)
    (global-set-key (kbd "C-c <down>")  'windmove-down)
