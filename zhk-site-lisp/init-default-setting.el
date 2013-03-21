
;; 初始化系统的一些设置


;; settings for chinese display
;; (set-language-environment 'Chinese-GB)
;; (set-keyboard-coding-system 'euc-cn)
;; (set-clipboard-coding-system 'euc-cn)
;; (set-terminal-coding-system 'euc-cn)
;; (set-buffer-file-coding-system 'euc-cn)
;; (set-selection-coding-system 'euc-cn)
;; (modify-coding-system-alist 'process "*" 'euc-cn)
;; (setq default-process-coding-system
;;       '(euc-cn . euc-cn))
;; (setq-default pathname-coding-system 'euc-cn)


;; (setq buffer-file-coding-system 'utf-8)
;;+coding-system
;; (prefer-coding-system 'utf-8)
;; 系统默认设置



(prefer-coding-system 'utf-8)
;; 系统默认设置

(setq user-mail-address "hapsunday@gmail.com")

;; 更新环境变量的方法
;; (if (eq system-type 'cygwin)
;;     (setenv "PATH" (concat "/bin/:/usr/bin/"  
;;                            path-separator  
;;                            (getenv "PATH")))
;;     )

;;Ctrl+Space无效
(global-set-key (kbd "C-SPC")'nil)
;;关闭烦人的出错时的提示声。
(setq visible-bell t)

;; 用一个很大的 kill ring. 这样防止我不小心删掉重要的东西。我很努莽的，你知道 :P 
(setq kill-ring-max 200)


;; 设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插入两个空格。 
(setq sentence-end
      "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;;设定句子结尾，主要针对中文设置
(setq sentence-end
      "\\([$(A!##!#?(B]\\|$(A!-!-(B\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;; 可以递归的使用 minibuffer。我经常需要这么做。 
(setq enable-recursive-minibuffers t)

;; 防止页面滚动时跳动，
;; scroll-margin 3 可以在靠近屏幕边沿3行时
;; 就开始滚动，可以很好的看到上下文。
(setq scroll-margin 3
      scroll-conservatively 10000)

;; 把缺省的 major mode 设置为 text-mode, 而不是几乎什么功能也没有的 fundamental-mode. 
(setq default-major-mode 'text-mode)


;; =============================================================
(global-font-lock-mode t)               ;语法高亮
(auto-image-file-mode t)                ;打开图片显示功能
(column-number-mode t)                  ;显示列号
(setq column-number-mode t)             ;显示列号 the other way
;; (setq line-number-mode t)               ;显示行号
(setq default-fill-column 60)           ;默认显示 80列就换行
(setq-default fill-column 60)
(show-paren-mode t)                     ;显示括号匹配
(setq x-select-enable-clipboard t)      ;支持emacs和外部程序的粘贴
(fset 'yes-or-no-p 'y-or-n-p)           ;以y/n代表 yes/no
(show-paren-mode t)                     ;显示括号匹配
(setq show-paren-style 'parentheses)    ;显示括号匹配时，不跳转
;; (menu-bar-mode nil)                  ;去掉菜单栏
(setq frame-title-format "zhk@%b")      ;在标题栏提示你目前在什么位置

;; 去掉滚动条
(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

;; 去掉工具栏
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode nil))

(setq inhibit-startup-message t)        ;关闭开启画面
(setq make-backup-files nil)            ;不产生备份文件
;;(tool-bar-mode -1)                      ;选择小工具栏图标

;;设置默认工作目录
(if (eq system-type 'windows-nt)
    (setq default-directory "~/")
  (if (or (eq system-type 'cygwin)
          (eq system-type 'gnu/linux)
          (eq system-type 'linux))
      (setq default-directory "~/"))
  )

;; 显示时间，格式如下
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 30)

;; 把这些缺省禁用的功能打开。 
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)

;;设置一下备份时的版本控制，这样更加安全。 
(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)

;; 让 dired 可以递归的拷贝和删除目录。 
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)


;;所有的备份文件都放置在~/backups目录下
;; (if (eq system-type 'windows-nt)
;; (setq backup-directory-alist (quote (("." . "~/backups"))))
(setq backup-directory-alist (quote (("." . "~/backups"))))
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq backup-directory-alist '(("." . "~/backups")))
(setq backup-by-copying t)
;;emacs中，改变文件时，默认都会产生备份文件（以~结尾的文件）。可以完全去掉
;;（并不可取），也可以制定备份的方式。这里采用的是，把所有的文件备份都放在一个
;;固定的地方。对于每个备份文件，保留最原始的两个版本和最新的五个版本。
;;并且备份的时候，备份文件是复件，而不是原件。


;;自动补全功能，这是从王垠主页直接copy来的，引用一些他对此的说明。
;;你可以设置以下hippie-expand的补全方式。它是一个优先列表，
;;hippie-expand会优先使用表最前面的函数来补全。
;;这是说，首先使用当前的buffer补全，如果找不到，就到别的可见的窗口里寻找，
;;如果还找不到，那么到所有打开的buffer去找，如果还……那么到kill-ring里，
;;到文件名，到简称列表里，到list......当前使用的匹配方式会在echo区域显示。
;;特别有意思的是try-expand-line，它可以帮你补全整整一行文字。我很多时候有
;;两行文字大致相同，只有几个字不一样，但是我懒得去copy paste一下。那么我就
;;输入这行文字的前面几个字。然后多按几下M-/就能得到那一行。
(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(try-expand-line
        try-expand-line-all-buffers
        try-expand-list
        try-expand-list-all-buffers
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name
        try-complete-file-name-partially
        try-complete-lisp-symbol
        try-complete-lisp-symbol-partially
        try-expand-whole-kill))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


(provide 'init-default-setting)

