;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 设置输入法
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/eim"))
(autoload 'eim-use-package "eim" "Another emacs input method")
(setq eim-use-tooltip t)

(defun zhk-eim-wb-activate-function ()
  (add-hook 'eim-active-hook
            (lambda ()
              (progn
                (let ((map (eim-mode-map)))
                  (define-key eim-mode-map "-" 'eim-previous-page)
                  (define-key eim-mode-map "=" 'eim-next-page))
                (setq eim-page-length 6))
              )))

;; 设置五笔输入法
;; 1. 临时拼音输入汉字。用 z 开头可以输入汉字的拼音并查看其五笔字码。
;; 2. 反查五笔。用 M-x eim-describe-char 可以查看光标处汉字的五笔字码。
;; 3. 加入自造词。M-x eim-table-add-word，默认是光标前的两个汉字。用 C-a 和 C-e 调整。

(register-input-method
 "eim-wb" "euc-cn" 'eim-use-package
 "五笔" "汉字五笔输入法" "zhk-wb.txt" 'zhk-eim-wb-activate-function)

(setq eim-wb-use-gbk t)     ;造词的时候使用

;; 设置拼音输入法
(register-input-method
 "eim-py" "euc-cn" 'eim-use-package
 "拼音" "汉字拼音输入法" "py.txt")

;; 用 ; 暂时输入英文
(require 'eim-extra)
(global-set-key ";" 'eim-insert-ascii)
(set-input-method "eim-wb")
(setq activate-input-method t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-eim)
