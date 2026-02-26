;;1为显示行号;-1隐藏行号
(global-display-line-numbers-mode 1)

;;显示的行号为相对行号
(setq display-line-numbers-type 'relative)

(setq inhibit-startup-screen 1)

(toggle-frame-maximized)

(tool-bar-mode -1)
(menu-bar-mode -1)


;;(scroll-bar-mode -1)
(scroll-all-mode -1)

(setq-default cursor-type '(bar . 5))

;;高亮当前行
(global-hl-line-mode 1)

;;安装主题
;;(use-package monokai-theme)
;;(load-theme 'monokai 1)
;;
;;(use-package doom-themes)
;;(load-theme 'doom-one 1)

;;(use-package gruvbox-theme)
;;(load-theme 'gruvbox-dark-medium 1)

(use-package simple
  :ensure nil
  :hook (after-init . size-indication-mode)
  :init
  (progn
    (setq column-number-mode t)
    ))

;; 这里的执行顺序非常重要，doom-modeline-mode 的激活时机一定要在设置global-mode-string 之后‘



;;(use-package powerline
;;  :init
;;  ; 对于 Evil 模式用户
;;  (powerline-default-theme)
;;  :ensure t)
;;
;;(use-package airline-themes
;; :ensure t)
;;
;;(load-theme 'airline-base16_gruvbox_dark_hard t)


(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))



(use-package doom-themes
  :ensure t
  :custom
  (doom-themes-enable-bold t)    ; 启用粗体
  (doom-themes-enable-italic t)  ; 启用斜体
  (doom-themes-treemacs-theme "doom-gruvbox")  ; Treemacs图标主题
  :config
  ;; 加载主题（替换为你喜欢的主题名）doom-gruvbox
  (load-theme 'doom-gruvbox t)
  
  ;; 启用Treemacs主题支持
  (doom-themes-treemacs-config)

  (doom-modeline-mode t)
  
  ;; 增强Org-mode显示效果
  (doom-themes-org-config)
  )



;;隐藏modeline中次要模式名称
;;(require 'diminish)
;;; Hide lighter from yas-minor-mode
;;(diminish 'yas-minor-mode)
;;; Hide lighter from hungry-delete-mode
;;(diminish 'hungry-delete-mode)
;;; Hide lighter from company-mode
;;(diminish 'company-mode)
;;; Hide lighter from evil-snipe-local-mode
;;(diminish 'evil-snipe-local-mode)
;;; Hide lighter from evil-collection-unimpaired-mode
;;(diminish 'evil-collection-unimpaired-mode)
;;; Hide lighter from anzu-mode
;;(diminish 'anzu-mode)
;;; Hide lighter from eldoc-mode
;;(diminish 'eldoc-mode)

;;设置本地环境编码
(set-locale-environment "en_US.UTF-8")
;; 这个是为了在 org mode 中用英文显示日期，默认是中文
(setq system-time-locale "C")

(setq display-time-format "  %H:%M")
;;不显示系统负载
(setq display-time-default-load-average nil)
(display-time-mode 1)

(provide 'init-ui)

