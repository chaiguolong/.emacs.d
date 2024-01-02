(use-package evil
  :ensure t
  :init
  ;;默认的按键绑定用处不大
  (setq evil-want-keybinding nil)
  ;;C-u上下滚动
  (setq evil-want-C-u-scroll t)
  (evil-mode)

  ;;在插入模式的时候希望使用emacs的快键键,但又不希望进入emacs state
  ;;将evil-insert-state-map 置为空
  (setcdr evil-insert-state-map nil)
  ;;将esc绑定到evil-insert-state-map
  (define-key evil-insert-state-map [escape] 'evil-normal-state)

  ;;新增空行
  (define-key evil-normal-state-map (kbd "[ SPC") (lambda () (interactive) (evil-insert-newline-above) (forward-line)))
  (define-key evil-normal-state-map (kbd "] SPC") (lambda () (interactive) (evil-insert-newline-below) (forward-line -1)))

  ;;qiehuan buffer
  (define-key evil-normal-state-map (kbd "[ b") 'previous-buffer)
  (define-key evil-normal-state-map (kbd "] b") 'next-buffer)
  (define-key evil-motion-state-map (kbd "[ b") 'previous-buffer)
  (define-key evil-motion-state-map (kbd "] b") 'next-buffer)

  ;;普通模式下dired的按键绑定
  (evil-define-key 'normal dired-mode-map
  ;;打开当期文件
  (kbd "<RET>") 'dired-find-alternate-file
  ;;进入上一级目录
  (kbd "C-k") 'dired-up-directory
  "`" 'dired-open-term
  "q" 'quit-window
  ;;在另一个窗口打开当前文件
  "o" 'dired-find-file-other-window
  ")" 'dired-omit-mode)


  ;; https://emacs.stackexchange.com/questions/46371/how-can-i-get-ret-to-follow-org-mode-links-when-using-evil-mode
  (with-eval-after-load 'evil-maps
    ;;org-mode下有一个链接,按回车键可以访问这个链接
    (define-key evil-motion-state-map (kbd "RET") nil))
  )

;;install undo-tree
(use-package undo-tree
  :diminish
  :init
  (global-undo-tree-mode 1)
  (setq undo-tree-auto-save-history nil)
  (evil-set-undo-system 'undo-tree))

;;使用*对当前词语进行搜索的时候,可以在modeline上显示总共有多少个结果,以及当前在哪个结果上
(use-package evil-anzu
  :ensure t
  :after evil
  :diminish
  :demand t
  :init
  (global-anzu-mode t))

;;社区贡献的按键绑定,有较强的合理性
(use-package evil-collection
  :ensure t
  :demand t
  :config
  ;;移除一些个性化的按键绑定
  (setq evil-collection-mode-list (remove 'lispy evil-collection-mode-list))
  (evil-collection-init)

  (cl-loop for (mode . state) in
	   '((org-agenda-mode . normal)
	     (Custom-mode . emacs)
	     (eshell-mode . emacs)
	     (makey-key-mode . motion))
	   do (evil-set-initial-state mode state)))


;;注释插件
(use-package evil-nerd-commenter
  :init
  (define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
  (define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
  )


;;用f去查找字符,会高亮所有结果,然耨用;移动到下一个
(use-package evil-snipe
  :ensure t
  :diminish
  :init
  (evil-snipe-mode +1)
  (evil-snipe-override-mode +1)
  )



(provide 'init-evil)
