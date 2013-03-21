;; 初始化一些自定义的快捷键

;; 保存文件
(define-key global-map (kbd "M-s") 'save-buffer)



;; ===================================================
;; 添加删除注释
;; 好在有一个 Alt-; 的快捷键，默认绑定了 comment-dwim，
;; 能注释/反注释当前激活的区域。如果没有激活区域，就在当前行末加注释
(defun qiang-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
If no region is selected and current line is not blank and we are not at the end of the line,
then comment current line.
Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'qiang-comment-dwim-line)

;; 这样一来，注释和反注释代码的操作只使用一个 Alt-; 键就全部搞定了，
;; Emacs 会心领神会地“照我说的做”。
;; ===================================================



;; ===================================================
;; 复制当前行  ref: http://emacser.com/torture-emacs.htm
;; Smart copy, if no region active, it simply copy the current whole line
(defadvice kill-line (before check-position activate)
  (if (member major-mode
              '(emacs-lisp-mode scheme-mode lisp-mode
                                c-mode c++-mode objc-mode js-mode
                                latex-mode plain-tex-mode))
      (if (and (eolp) (not (bolp)))
          (progn (forward-char 1)
                 (just-one-space 0)
                 (backward-char 1)))))

(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive (if mark-active (list (region-beginning) (region-end))
                 (message "Copied line")
                 (list (line-beginning-position)
                       (line-beginning-position 2)))))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

;; Copy line from point to the end, exclude the line break
(defun qiang-copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (point)
                  (line-end-position))
  ;; (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(global-set-key (kbd "M-k") 'qiang-copy-line)

;; 上面还多加了一个配置，就是把 Alt-k 设成复制光标所在处到行尾。与 kill-line 的 Ctrl-k 对应。
;; 如果是要拷贝一整行的话，只要将光标移动到该行任意位置，按下 Alt-w 就行了。
;; 如果是复制某个位置到行尾的文字的话，就把光标移到起始位置处，按 Alt-k 。比默认的操作简化了很多。 
;; ===================================================


(provide 'init-local-keybind)

