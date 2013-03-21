
;; (setenv "PYTHONPATH"
;;         (concat
;;          (getenv "PYTHONPATH")
;;          (format ":%s"
;;                  (expand-file-name
;;                   "~/.emacs.d/site-lisp/python-stuff/pinard-Pymacs/build/lib/"))))


(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp"))
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/zhk-site-lisp/"))

(require 'eval-after-load)

(require 'init-font)            ;自定义字体
(require 'init-color-theme)     ;顔色主题
(require 'init-default-setting) ;自定义一些系统项

;; ====================================
;; Universal Charset Auto Detector for Emacs
;; http://code.google.com/p/unicad/
(require 'unicad)               ;文件编码相关的配置
;; ====================================


(require 'init-indent)          ;设置tab的间隔
(require 'init-linum)           ;设置行号
(require 'init-eim)             ;设置输入法
(require 'init-MultiTerm)       ;设置shell相关

(require 'init-auto-complete)   ;自定义自动补全
(require 'init-code-folding)    ;设置代码折叠

(require 'init-python)          ;配置python相关的选项

;; ====================================
;; 初始化一些自定义的函数
(require 'init-local-function)

;; ====================================
;; 初始化一些自定义的快捷键
(require 'init-local-keybind)


;; ====================================
;;启用ibuffer支持，增强*buffer*  
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)


;; ====================================
;; ctypes 可以识别你的 C 文件里的类型定义 (typedef)。自动对它们进行语法加亮。
;; (add-to-list 'load-path "~/.emacs.d/site-lisp")
(require 'ctypes)
(ctypes-auto-parse-mode 1)


;; ====================================
;; Ref: http://docs.huihoo.com/homepage/shredderyin/emacs_elisp.html
;; 非常酷的一个扩展。可以“所见即所得”的编辑一个文本模式的表格。
(autoload 'table-insert "table" "WYGIWYS table editor")


;; ====================================
;; 另一个五笔输入法
;; http://daiyuwen.freeshell.org/gb/wubi/wubi.html

;; ====================================
;; init asymptote
(require 'init-asymptote)


(require 'init-custom)


;; Activation org-mode
;; The following lines are always needed.  Choose your own keys.
;; (add-to-list 'load-path "PATH-to-where-your org-file")
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)

;; turn on soft wrapping mode for org mode
(add-hook 'org-mode-hook
          (lambda () (setq truncate-lines nil)))


;; (setq zhk-auctex-file "~/.emacs.d/zhk-auctex.el")
;; (load zhk-auctex-file 'noerror)



;; 多台电脑间同步 Emacs 配置文件
;; 参考： http://blog.waterlin.org/articles/how-to-sync-emacs-configure-files.html
;; 可以用 (system-type) 来识别当前机器的操作系统版本
;; 也可以根据 (system-name) 来判断一下你的 Emacs 所在路径。
;; 当要在 Window 或是 Linux 机器上识别、配置不同的代码的时
;;如果是 Windows 平台，则进行如下设置
;; (if (eq system-type 'windows-nt)
;;     ;;current system is Windows, do some specific setting for Windows
;;     (message "Current system is Windows!")

;;   ;;else current system is Linux, do some specific setting for Linux
;;   (if (or (eq system-type 'cygwin)
;;           (eq system-type 'gnu/linux)
;;           (eq system-type 'linux))
;;       (message "Current system is Linux!"))
;;   )


(provide 'init)
