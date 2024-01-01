(electric-pair-mode t)

(show-paren-mode t)

;;去除备份文件
(setq make-backup-files nil)

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

(provide 'init-basic)
