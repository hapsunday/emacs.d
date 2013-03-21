;; 自定义一些有用的函数

;;__________________________________________________________
;;    Handle files with mixed UNIX and DOS line endings.
;;__________________________________________________________
(defun remove-dos-eol ()
  "Do not use '^M' in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))



;; 这是一个很小的函数。你是不是觉得 Emacs 在匹配的括号
;; 之间来回跳转的时候按 C-M-f 和 C-M-b 太麻烦了？
;; vi的 % 就很方便，我们可以把 % 设置为匹配括号。
;; 可是你想输入 % 怎么办呢？
;; 一个很巧妙的解决方案就是，当 % 在括号上按下时，
;; 那么匹配括号，否则输入一个 %。你只需要在 .emacs 
;; 文件里加入这些东西就可以达到目的
(global-set-key "%" 'match-paren)

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; go-to-char
;; 这个函数是一个 vi 的 "f" 命令的替代品。vi的用户知道，vi有一个特别好的命令 "f"。当你按 "fx", x 是任意一个字符时，光标就会移动到下一个 "x" 处。这之后只要按 ";"(分号)，光标就到再下一个 "x"
;; 有了这段代码之后，当你按 C-c a x (x 是任意一个字符) 时，光标就会到下一个 x 处。再次按 x，光标就到下一个 x。比如 C-c a w w w w ..., C-c a b b b b b b ... 
(defun wy-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `wy-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
                     char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))

(define-key global-map (kbd "C-c a") 'wy-go-to-char)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; ===================================================
;; 拷贝代码自动格式化 ref: http://emacser.com/torture-emacs.htm
;; 选中一块代码，按 Ctrl-Alt-\ 对这块代码重新进行格式化。
(dolist (command '(yank yank-pop))
  (eval
   `(defadvice ,command (after indent-region activate)
      (and (not current-prefix-arg)
           (member major-mode
                   '(emacs-lisp-mode
                     lisp-mode
                     clojure-mode
                     scheme-mode
                     haskell-mode
                     ruby-mode
                     rspec-mode
                     python-mode
                     c-mode
                     c++-mode
                     objc-mode
                     latex-mode
                     js-mode
                     plain-tex-mode))
           (let ((mark-even-if-inactive transient-mark-mode))
             (indent-region (region-beginning) (region-end) nil))))))

;; 你可以加入或删除一些 mode 名称来定制上面的配置。 
;; ===================================================


(provide 'init-local-function)
