(global-display-line-numbers-mode 1)

(setq inhibit-startup-screen 1)

(toggle-frame-maximized)

(tool-bar-mode -1)
(menu-bar-mode -1)

(scroll-bar-mode -1)

(setq-default cursor-type '(bar . 5))

;;高亮当前行
(global-hl-line-mode 1)

;;安装主题
;;(package-install 'monokai-theme)
;;(load-theme 'monokai 1)

(package-install 'doom-themes)
(load-theme 'doom-one 1)

(provide 'init-ui)

