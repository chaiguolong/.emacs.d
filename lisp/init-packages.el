(require 'package)
(setq package-archives '(("gnu"    .  "http://elpa.gnu.org/packages/")
			 ("nongnu" .  "https://elpa.nongnu.org/nongnu/")
			 ("melpa"  .  "https://melpa.org/packages/")))

(package-initialize)

;;防止反复调用 package-refresh-contents 会影响加载速度
(when (not package-archive-contents)
  (package-refresh-contents))

;;; 这个配置一定要配置在 use-package 的初始化之前，否则无法正常安装
(assq-delete-all 'org package--builtins)
(assq-delete-all 'org package--builtin-versions)


;; Setup `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package restart-emacs
  :ensure t)

;;启用hungry-delete-mode
;;可以一次删除多个空格
(use-package hungry-delete
  :ensure t
  :init
  (global-hungry-delete-mode t)
  )

(use-package js2-mode
  :ensure t
  :init
  ;;config for js-2-mode
  (setq auto-mode-alist
	(append
	'(("\\.js\\'" . js2-mode))
	auto-mode-alist))
  )



;;(use-package evil
;;  :ensure t
;;
;;  :init
;;  ;; Enable Evil
;;  (require 'evil)
;;  (evil-mode 1)
;;  )


;;(use-package quelpa)
;;
;;(unless (package-installed-p 'quelpa-use-package)
;;  (quelpa
;;   '(quelpa-use-package
;;     :fetcher git
;;     :url "https://github.com/quelpa/quelpa-use-package.git")))
;;
;;(use-package quelpa-use-package
;;  :init
;;  (setq quelpa-use-package-inhibit-loading-quelpa t)
;;  :demand t)

(provide 'init-packages)
