;开启easy template
(require 'org-tempo)

;; 安装org 之前，一定要配置 use-package 不使用内置的org 版本，可以使用本段代码最后面的代码，具体位置可以参考视频
(use-package org
  :pin melpa-tuna
  :ensure t)

(use-package org-contrib
  :pin nongnu
  :ensure t)

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
	      (sequence "WAITING(w@/!)" "SOMEDAY(S)" "|" "CANCELLED(c@/!)" "MEETING(m)" "PHONE(p)"))))

(require 'org-checklist)
;; need repeat task and properties
(setq org-log-done t)
(setq org-log-into-drawer t)

(global-set-key (kbd "C-c a") 'org-agenda)
;;(setq org-agenda-files '("~/gtd.org"))
(setq org-agenda-files '("~/.emacs.d/gtd.org"))
(setq org-agenda-span 'day)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "Workspace")
	 "* TODO [#B] %?\n  %i\n %U"
	 :empty-lines 1)))

(global-set-key (kbd "C-c r") 'org-capture)

(setq org-agenda-custom-commands
      '(("c" "重要且紧急的事"
	 ((tags-todo "+PRIORITY=\"A\"")))
	;; ...other commands here
	))

(provide 'init-org)
