;; 自定义一些字体相关的配置

;; "华文细黑")))))
;; :family "DejaVu Sans Mono")))))

;; 设置中英文不同字体 ref: http://emacser.com/torture-emacs.htm


;; 如果不是consol环境
(if window-system
    (progn
      (if (eq system-type 'cygwin)
          ;; 因为cygwin的字体在比较小的时候，防锯齿效果比较差
          (set-face-attribute
           'default nil :font "Consolas 13")
        ;; 其它系统默认使用苹果的Monaco字体
        (set-face-attribute
         'default nil :font "Monaco 11")
        )
      ;; 同样设置中文字体
      (if (eq system-type 'cygwin)
          (dolist (charset '(kana han symbol cjk-misc bopomofo))
            (set-fontset-font (frame-parameter nil 'font)
                              charset
                              (font-spec :family "Microsoft Yahei" :size 15)))
        (dolist (charset '(kana han symbol cjk-misc bopomofo))
          (set-fontset-font (frame-parameter nil 'font)
                            charset
                            (font-spec :family "Microsoft Yahei" :size 15)))
        )
      )
  (add-to-list 'default-frame-alist '(background-color . "#080808")))


(provide 'init-font)

