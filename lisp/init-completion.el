(package-install 'company)

(global-company-mode 1)

(setq company-minimum-prefix-length 1)

(setq company-idle-delay 0)

(setq tab-always-indent 'complete)

;;让mini-buffer更具有交互性
(package-install 'vertico)
(vertico-mode t)

;;在M-x查找函数是可以进行无序查找,提高emacs的可用性
(package-install 'orderless)
(setq completion-styles '(orderless))

;;将M-x查找的函数的命令注释显示在函数后面.
(package-install 'marginalia)
(marginalia-mode t)


;;目前觉得这个插件不太用得到,可能还没有到哪个层次
(package-install 'embark)
(setq prefix-help-command 'embark-prefix-help-command)

(package-install 'consult)

;;配置搜索中文,不需要注释掉
;;(eval-after-load 'consult
;;  (progn
;;    (setq
;;     consult-narrow-key "<"
;;     consult-line-numbers-widen t
;;     consult-async-min-input 2
;;     consult-async-refresh-delay  0.15
;;     consult-async-input-throttle 0.2
;;     consult-async-input-debounce 0.1)
;;    ))


;; 禁用左尖括号
(setq electric-pair-inhibit-predicate
      `(lambda (c)
	 (if (char-equal c ?\<) t (,electric-pair-inhibit-predicate c))))

(add-hook 'org-mode-hook
	  (lambda ()
	    (setq-local electric-pair-inhibit-predicate
			`(lambda (c)
			   (if (char-equal c ?\<) t (,electric-pair-inhibit-predicate c))))))

(package-install 'embark-consult)
(package-install 'wgrep)
(setq wgrep-auto-save-buffer t)

(eval-after-load 'consult
  '(eval-after-load 'embark
     '(progn
	(require 'embark-consult)
	(add-hook 'embark-collect-mode-hook #'consult-preview-at-point-mode))))

(package-install 'magit)

(provide 'init-completion)
