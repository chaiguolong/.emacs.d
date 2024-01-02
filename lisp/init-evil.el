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


;;(use-package evil
;;  :ensure t
;;
;;  :init
;;  ;; Enable Evil
;;  (require 'evil)
;;  (evil-mode 1)
;;  )

(provide 'init-evil)
