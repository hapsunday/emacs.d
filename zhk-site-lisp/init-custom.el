;; set completion-ignore-case
;; ref: http://www.gnu.org/software/emacs/manual/html_node/elisp/Basic-Completion.html#Definition%20of%20test-completion
(setq read-file-name-completion-ignore-case t)

;; C-z默认是挂起emacs，跳回到shell中，这对文本型的shell很有用。
;; 但在windows中，事实上变成了毫无实际意义的窗口最小化，
;; 浪费了C-z这么顺手的键。可以用以下代码把C-z改为一个类似C-x的组合起始键.
;; 允许使用C-z作为命令前缀
(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") 'ctl-z-map)

(global-set-key "\M-g" 'goto-line)

(defun zhk-change-coding-to-GBK ()
  (interactive)
  ;; (setq buffer-file-coding-system 'gbk)
  ;; (prefer-coding-system 'gbk)
  (set-language-environment 'Chinese-GB)
  (set-keyboard-coding-system 'euc-cn)
  (set-clipboard-coding-system 'euc-cn)
  (set-terminal-coding-system 'euc-cn)
  (set-buffer-file-coding-system 'euc-cn)
  (set-selection-coding-system 'euc-cn)
  (modify-coding-system-alist 'process "*" 'euc-cn)
  (setq default-process-coding-system
        '(euc-cn . euc-cn))
  (setq-default pathname-coding-system 'euc-cn)
  )

(defun zhk-change-coding-to-utf8 ()
  (interactive)
  (setq buffer-file-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)
  )



(defun zhk-add-math-dollar ()
  (interactive)
  (if 'current-input-method
      (toggle-input-method)
    )
  (insert "~$$~")
  (backward-char 2)
  )

(defun zhk-insert-comment ()
  (interactive)
  (when (region-active-p)
    (delete-region (region-beginning) (region-end) )
    )
  (insert "/**\n * @brief \n *\n * @param \n *\n * @return \n */\n"))



(defun zhk-insert-date ()
  "Insert current data yyyy-mm-dd."
  (interactive)
  (when (region-active-p)
    (delete-region (region-beginning) (region-end) )
    )
  (insert (format-time-string "%Y-%m-%d"))
  )

(defun zhk-insert-date-time ()
  "Insert current date-time string in full
ISO 8601 format.
Example: 2012-04-27T00:25:13-08:00
See: URL `http://en.wikipedia.org/wiki/ISO_8601'
"
  (interactive)
  (when (region-active-p)
    (delete-region (region-beginning) (region-end) ))
  (insert (concat
           (format-time-string "%Y-%m-%dT%T")
           ((lambda (x) (concat (substring x 0 3) ":"
                                (substring x 3 5)))
            (format-time-string "%z")))))

(defun zhk-insert-time ()
  "Insert current time"
  (interactive)
  (when (region-active-p)
    (delete-region (region-beginning) (region-end) ))
  (insert (format-time-string "%Y/%m/%d %T")))


(global-set-key "\C-zt" 'zhk-insert-date-time)
(global-set-key "\C-zd" 'zhk-insert-date)

;;C-Space被输入法占用，改用C-c m来标记文本块
(global-set-key "\C-cm" 'set-mark-command)
(global-set-key "\C-zm" 'set-mark-command)


(defun zhk-insert-code-header ()
  "Insert Source Code comment header"
  (interactive)
  (when (region-active-p)
    (delete-region (region-beginning) (region-end) )
    )
  (insert (file-name-nondirectory (buffer-file-name)))
  )


;;用C-z i快速打开~/.emacs文件。  
(defun open-init-file ()
  (interactive)  
  (find-file "~/.emacs"))  

(global-set-key "\C-zi" 'open-init-file)

;;用C-z k快速打开自定义的按键说明文件  
(defun open-key-info-file ()
  (interactive)
  (split-window-horizontally)
  (find-file-other-window "~/.emacs.d/reference/emacs_keymap.txt")
  (outline-mode)
  (hide-body))

(global-set-key "\C-zk" 'open-key-info-file)

(defun open-zhk-custom-file()
  (interactive)
  (find-file "~/.emacs.d/zhk-custom.el"))
(global-unset-key "\C-zj")
(global-set-key "\C-zj" 'open-zhk-custom-file)



;; 补全文件名字
(defun loco-complete-file-name ()
  (interactive)
  (auto-complete '(ac-source-files-in-current-dir
                   ac-source-file
                   )))
(global-set-key (kbd "C-z /") 'loco-complete-file-name);



;; 补全英语单词
(defun ac-expand-english-words ()
  (interactive)
  (if (file-exists-p "/usr/share/dict/words")
      (find-file-noselect "/usr/share/dict/words")
    (if (file-exists-p "~/.emacs.d/site-lisp/auto-complete/american-english")
        (find-file-noselect "~/.emacs.d/site-lisp/auto-complete/american-english")))
  (call-interactively 'ac-complete-words-in-all-buffer))

(define-key global-map (kbd "C-z w") 'ac-expand-english-words)




;; Swap windows - 
;; ref: http://www.millingtons.eclipse.co.uk/glyn/dotemacs.html
(defun swap-windows ()
  "If you have 2 windows, it swaps them."
  (interactive)
  (cond ((/= (count-windows) 2)
         (message "You need exactly 2 windows to do this."))
        (t
         (let* ((w1 (first (window-list)))
                (w2 (second (window-list)))
                (b1 (window-buffer w1))
                (b2 (window-buffer w2))
                (s1 (window-start w1))
                (s2 (window-start w2)))
           (set-window-buffer w1 b2)
           (set-window-buffer w2 b1)
           (set-window-start w1 s2)
           (set-window-start w2 s1))))
  (other-window 1))

(global-set-key (kbd "C-c s") 'swap-windows)




;; ===== Turn on Auto Fill mode automatically in all modes =====
;; Auto-fill-mode the the automatic wrapping of lines and insertion of
;; newlines when the cursor goes over the column limit.
;; This should actually turn on auto-fill-mode by default in all major
;; modes. The other way to do this is to turn on the fill for specific modes
;; via hooks.
;; (setq auto-fill-mode 1)





;; 使用 C++ mode， 感谢csdn yq_118
(add-to-list 'auto-mode-alist (cons "\\.h$" #'c++-mode))
(add-to-list 'auto-mode-alist (cons "\\.c$" #'c-mode))

;; (add-hook 'c-mode-common-hook
;;           ( lambda()
;;             (c-set-style "k&r")
;;             (setq c-basic-offset 4)))
;; (add-hook 'c++-mode-hook
;;           ( lambda()
;;             (c-set-style "k&r")
;;             (setq c-basic-offset 4)))






;; Load the C++ and C editing modes and specify which file extensions
;; correspond to which modes.
(autoload 'python-mode "python-mode" "Python editing mode." t)
(setq auto-mode-alist
      (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist
      (cons '("python" . python-mode) interpreter-mode-alist))

(autoload 'c++-mode "cc-mode" "C++ Editing Mode" t)
(autoload 'c-mode "c-mode" "C Editing Mode"   t)
(setq auto-mode-alist
      (append '(("\\.C\\'" . c++-mode)
                ("\\.cc\\'" . c++-mode)
                ("\\.c\\'" . c++-mode)
                ("\\.h\\'"  . c++-mode))
              auto-mode-alist))


;; This is how emacs tells the file type by the file suffix.
(setq auto-mode-alist
      (append '(("\\.mss$" . scribe-mode))
              '(("\\.bib$" . bibtex-mode))
              '(("\\.tex$" . latex-mode))
              '(("\\.obj$" . lisp-mode))
              '(("\\.st$"  . smalltalk-mode))
              '(("\\.Z$"   . uncompress-while-visiting))
              '(("\\.cs$"  . indented-text-mode))
              '(("\\.C$"   . c++-mode))
              '(("\\.cc$"  . c++-mode))
              '(("\\.icc$" . c++-mode))
              '(("\\.c$"   . c-mode))
              '(("\\.y$"   . c-mode))
              '(("\\.h$"   . c++-mode))
              auto-mode-alist))


(provide 'init-custom)

