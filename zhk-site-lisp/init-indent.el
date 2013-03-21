;; initial indent size


;; ===================================================
;; 设置缩进
;; ref http://www.jwz.org/doc/tabs-vs-spaces.html
;; set for tabs
(setq c-basic-offset 4)
(setq tab-width 4)
(setq-default tab-width 4)
(setq indent-tabs-mode nil)
;; To make emacs use spaces instead of tabs
;;            (Added by Art Lee on 2/19/2008)
(setq-default indent-tabs-mode nil)


(setq c-default-style '((java-mode . "java")
                        (c-mode . "k&r")
                        (c++-mode . "k&r")
                        (cc-mode . "k&r")
                        ))

(defun my-make-CR-do-indent ()
  (define-key c-mode-base-map "\C-m" 'c-context-line-break)
  )
(add-hook 'c-initialization-hook 'my-make-CR-do-indent)

(defun zhk-set-tabs-width ()
  (setq c-basic-offset 4)
  (setq tab-width 4)
  (setq-default indent-tabs-mode nil))
(add-hook 'c-mode-common-hook    'zhk-set-tabs-width)
(add-hook 'python-mode-hook      'zhk-set-tabs-width)
(add-hook 'emacs-lisp-mode-hook  'zhk-set-tabs-width)
(add-hook 'lisp-mode-hook        'zhk-set-tabs-width)
(add-hook 'sh-mode-hook          'zhk-set-tabs-width)


;; ============================================================
;; http://stackoverflow.com/questions/1587972/how-to-display-indentation-guides-in-emacs
(add-to-list 'load-path
             (expand-file-name
              "~/.emacs.d/site-lisp/Highlight-Indentation"))
(require 'highlight-indentation)
(add-hook 'c-mode-common-hook   'highlight-indentation-mode)
(add-hook 'python-mode-hook     'highlight-indentation-mode)
(add-hook 'emacs-lisp-mode-hook 'highlight-indentation-mode)
(add-hook 'lisp-mode-hook       'highlight-indentation-mode)

;; ============================================================
;; http://www.emacswiki.org/emacs/AutoIndentation
(defun zhk-set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'lisp-mode-hook 'zhk-set-newline-and-indent)
(add-hook 'emacs-lisp-mode-hook 'zhk-set-newline-and-indent)
(add-hook 'sh-mode-hook         'zhk-set-newline-and-indent)

(provide 'init-indent)

