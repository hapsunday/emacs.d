;; 显示行号
(require 'linum)

;; (global-linum-mode 1)
;; 行号后加一空格 
(defvar my-linum-format-string "%4d ")

(add-hook 'linum-before-numbering-hook 'my-linum-get-format-string)

(defun my-linum-get-format-string ()
  (let* ((width (length (number-to-string
                         (count-lines (point-min) (point-max)))))
         (format (concat "%" (number-to-string width) "d ")))
    (setq my-linum-format-string format)))

(setq linum-format 'my-linum-format)

(defun my-linum-format (line-number)
  (propertize (format my-linum-format-string line-number) 'face 'linum))


(defun zhk-turn-on-linum-mode ()
  (linum-mode t))


(add-hook 'emacs-lisp-mode-hook 'zhk-turn-on-linum-mode)
(add-hook 'lisp-mode-hook       'zhk-turn-on-linum-mode)
(add-hook 'c-mode-common-hook   'zhk-turn-on-linum-mode)
(add-hook 'python-mode-hook     'zhk-turn-on-linum-mode)
(add-hook 'sh-mode-hook         'zhk-turn-on-linum-mode)

(provide 'init-linum)
