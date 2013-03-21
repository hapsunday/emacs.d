;; 陈向阳、方汉写的《Linux实用大全》上看到了如何为emacs添加输入法
;; http://daiyuwen.freeshell.org/gb/wubi/wubi.html

(add-to-list 'load-path
             (expand-file-name "~/.emacs.d/site-lisp/wubi"))

(require 'wubi)
(wubi-load-local-phrases) ; add user's Wubi phrases

(register-input-method
 "chinese-wubi" "Chinese-GB" 'quail-use-package
 "WuBi" "WuBi"
 "wubi")

(if (< emacs-major-version 21)
    (setup-chinese-gb-environment)
  (set-language-environment 'Chinese-GB))

(setq default-input-method "chinese-wubi")

(provide 'init-wubi)

