(electric-pair-mode t)

(show-paren-mode t)

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

;;删除选中的文字
(delete-selection-mode 1)

;开启easy template
(require 'org-tempo)
;;外部磁盘修改的文字自动load当前buffer,保持文件的同步性
(global-auto-revert-mode 1)
;;去除警报声
(setq ring-bell-function 'ignore)
;;y-yes ;n-no
(fset 'yes-or-no-p 'y-or-n-p)

(provide 'init-basic)
