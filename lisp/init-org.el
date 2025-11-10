;开启easy template
(require 'org-tempo)

;; 安装org 之前，一定要配置 use-package 不使用内置的org 版本，可以使用本段代码最后面的代码，具体位置可以参考视频
;;(use-package org
;;  :pin melpa-tuna
;;  :ensure t)

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
      '(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "日常")
	 "* TODO [#B] %?\n  %i\n %U"
	 :empty-lines 1)
	("i" "Idea" entry (file+headline "~/.emacs.d/idea.org" "灵感")
	 "* %?"
	 :empty-lines 1)
	  ))

;;模版分组
(add-to-list 'org-capture-templates '("e" "English"))

(add-to-list 'org-capture-templates
             '("ea" "Puss_in_Boots" entry
               (file+headline "~/Documents/record/english/Puss_in_Boots.org" "Puss_in_Boots")
               "* 单词 \t\t\t:drill:\n%?%i\n** 释义 %i\n"
	       :empty-lines 1))

(add-to-list 'org-capture-templates
             '("eb" "Thumbelina" entry
               (file+headline "~/Documents/record/english/Thumbelina.org" "Thumbelina")
               "* 单词 \t\t\t:drill:\n%?%i\n** 释义 %i\n"
	       :empty-lines 1))


(add-to-list 'org-capture-templates
             '("ec" "Magic Tree" entry
               (file+headline "~/Documents/record/english/Magic_Tree.org" "Magic Tree")
               "* 单词 \t\t\t:drill:\n%?%i\n** 释义 %i\n"
	       :empty-lines 1))


;;(add-to-list 'org-capture-templates
;;             '("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "Workspace")
;;		"* TODO [#B] %?\n  %i\n %U" :empty-lines 1))


(global-set-key (kbd "C-c r") 'org-capture)

(setq org-agenda-custom-commands
      '(("c" "重要且紧急的事"
	 ((tags-todo "+PRIORITY=\"A\"")))
	;; ...other commands here
	))

(use-package ox-hugo
  :ensure t   ;Auto-install the package from Melpa
  :pin melpa  ;`package-archives' should already have ("melpa" . "https://melpa.org/packages/")
  :after ox)

(with-eval-after-load 'org-capture
  (defun org-hugo-new-subtree-post-capture-template ()
    "Returns `org-capture' template string for new Hugo post.
See `org-capture-templates' for more information."
    (let* ((title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
           (fname (org-hugo-slug title)))
      (mapconcat #'identity
                 `(
                   ,(concat "* TODO " title)
                   ":PROPERTIES:"
                   ,(concat ":EXPORT_FILE_NAME: " fname)
                   ":END:"
                   "\n\n")          ;Place the cursor here finally
                 "\n")))

  (add-to-list 'org-capture-templates
               '("h"                ;`org-capture' binding + h
                 "Hugo post"
                 entry
                 ;; It is assumed that below file is present in `org-directory'
                 ;; and that it has a "Blog Ideas" heading. It can even be a
                 ;; symlink pointing to the actual location of all-posts.org!
                 (file+headline "~/blog/all-blog.org" "Blog Ideas")
                 (function org-hugo-new-subtree-post-capture-template))))


(use-package org-download
  :ensure t
  :demand t
  :after org
  :config

  
  ;;(setq)org-download-image-org-width

  ;;//设置添加图片的默认宽度
  (setq org-download-image-org-width 300)
  ;;//设置图片实际尺寸为nil,这样才可以改变尺寸
  (setq org-image-actual-width nil)
  (add-hook 'dired-mode-hook 'org-download-enable)
  ;; :ensure-system-package (pngpaste . "brew install pngpaste")
  (setq org-download-screenshot-method "pngpaste %s")
  ;; https://imagemagick.org/script/download.php#windows  ImageMagick-7.1.0-portable-Q16-HDRI-x86.zip
  (defun org-download-annotate-default (link)
    "Annotate LINK with the time of download."
    (make-string 0 ?\s))

  (setq-default org-download-heading-lvl nil
                org-download-image-dir "./img"
                ;; org-download-screenshot-method "screencapture -i %s"
                org-download-screenshot-file (expand-file-name "screenshot.jpg" temporary-file-directory)))


;; active Babel languages
(org-babel-do-load-languages
'org-babel-load-languages
'((shell . t)
  (python . t)
  (js . t)))



;; <WARN> redefines org-format-latex as empty procedure when running non-graphical Emacs
;; 在终端模式下不能使用org-drill,看看下面这个命令可不可以有效
(unless (display-graphic-p) 
  (defun org-format-latex (prefix &optional beg end dir overlays msg forbuffer processing-type) ""))




(provide 'init-org)
