;; init multi term


(require 'multi-term)
(setq multi-term-program "/bin/bash")


;; http://jiabinary.org/2009/06/multi-term/
(global-set-key "\C-x." 'multi-term)
(global-set-key "\C-x," 'multi-term-dedicated-open)
(setq multi-term-dedicated-select-after-open-p t)

;; (add-to-list 'term-bind-key-alist '("C-x C-b" . ibuffer))
;; (add-to-list 'term-bind-key-alist '("C-\\" . toggle-input-method))

(setq term-unbind-key-list
      '("C-z" "C-x" "C-c" "C-h" "C-y" "C-\\" "C-x C-b"))




;; ‘term-unbind-key-list’ is a list of keys which emacs keeps for itself.
;;               By default it contains (“C-z” “C-c” “C-x” “C-h” “C-y” “<ESC>”)
;; ‘term-bind-key-alist’ is a list of keys and functions which you can use,
;;         for example to use Emacs style cursor movement to the multi-terminal.
;;               The default is long, so I’ll let you look it up yourself.
;; How to use “C-x C-c” to terminate an emacs session running in a multi-term.el buffer:

(provide 'init-MultiTerm)
