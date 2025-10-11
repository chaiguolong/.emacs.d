(electric-pair-mode t)

(show-paren-mode t)

(savehist-mode t)

(save-place-mode t)

;;默认采用utf-8
(setq default-buffer-coding-system 'utf-8)

;;去除备份文件
(setq make-backup-files nil)

;;不自动保存文件
(setq auto-save-default nil)

;;打开最近的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
;;用consult-buffer来打开最近文件
(global-set-key (kbd "C-x b") 'consult-buffer)

;;设置代理,用GUI的时候
(setq url-gateway-method 'socks)
(setq socks-server '("Default server" "127.0.0.1" 1081 5))

;;自动折行
;;(toggle-truncate-lines 1)

;;删除选中的文字
(delete-selection-mode 1)

;;外部磁盘修改的文字自动load当前buffer,保持文件的同步性
(global-auto-revert-mode 1)
;; 也自动刷新 dired，但保持静默
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
;;去除警报声
(setq ring-bell-function 'ignore)
;;y-yes ;n-no
(fset 'yes-or-no-p 'y-or-n-p)

;;设置字体大小
(set-face-attribute 'default nil :height 180)

;;去掉滚动条
(set-scroll-bar-mode nil)


;;好像是将前面使用过的命令记录下来,放在最前面
(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode)
  :init (setq enable-recursive-minibuffers t ; Allow commands in minibuffers
	      history-length 1000
	      savehist-additional-variables '(mark-ring
					      global-mark-ring
					      search-ring
					      regexp-search-ring
					      extended-command-history)
	      savehist-autosave-interval 300)
  )

(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

(use-package simple
  :ensure nil
  :hook (after-init . size-indication-mode)
  :init
  (progn
    (setq column-number-mode t)
    ))

(provide 'init-basic)
