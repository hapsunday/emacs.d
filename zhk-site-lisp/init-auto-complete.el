;; initial auto-complete

;; 
;; https://github.com/auto-complete
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/auto-complete"))
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories 
             (expand-file-name "~/.emacs.d/site-lisp/auto-complete/dict"))

(set-default 'ac-sources
             '(
               ac-source-semantic-raw
               ac-source-yasnippet
               ac-source-dictionary
               ac-source-abbrev
               ac-source-variables
               ac-source-symbols
               ac-source-features
               ac-source-functions
               ac-source-words-in-buffer  ;去掉加快速度
               ac-source-words-in-same-mode-buffers
               ac-source-imenu
               ac-source-files-in-current-dir
               ac-source-filename
               ))


;; (ac-config-default)
(global-auto-complete-mode 1)

(eal-define-keys
'ac-complete-mode-map
`(("<return>" nil)
  ("RET"	nil)
  ("M-j"	ac-complete)))

;; 使用quick-help 
(setq ac-use-quick-help t)
(setq ac-quick-help-delay 1.0)

(setq ac-ignore-case 'smart)


(setq ac-auto-show-menu t
      ac-auto-start t
      ac-dwim t
      ac-candidate-limit ac-menu-height
      ac-quick-help-delay .5
      ac-disable-faces nil)



;; An emacs plugin to complete C and C++ code using libclang
;; https://github.com/Golevka/emacs-clang-complete-async
(add-to-list 'load-path
             (expand-file-name "~/.emacs.d/site-lisp/emacs-clang-complete-async"))
(require 'auto-complete-clang-async)

(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable
        (expand-file-name "~/.emacs.d/site-lisp/emacs-clang-complete-async/clang-complete"))
  ;; (setq ac-clang-flags "-I/home/dotazhang/Trunk-Proj/pioneer_proj/trunk/server/comlib/logger
  (setq ac-sources '(ac-source-clang-async
                     ac-source-yasnippet
                     ac-source-dictionary
                     ac-source-abbrev
                     ac-source-words-in-same-mode-buffers
                     ac-source-imenu
                     ac-source-files-in-current-dir
                     ac-source-filename
                     ))
  (ac-clang-launch-completion-process)
  )

(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(my-ac-config)


;; offers completions in shell mode 
;; https://github.com/monsanto/readline-complete.el
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/readline-complete/")
;; (require 'readline-complete)

;; (add-to-list 'ac-modes 'shell-mode)
;; (add-hook 'shell-mode-hook 'ac-rlc-setup-sources)

;; Reference: http://www.emacswiki.org/emacs/PosTip
(require 'pos-tip)

;; (pos-tip-w32-max-width-height)   ; Maximize frame temporarily



(require 'popup-pos-tip)
(defadvice popup-tip
  (around popup-pos-tip-wrapper (string &rest args) activate)
  (if (eq window-system 'x)
      (apply 'popup-pos-tip string args)
    ad-do-it))



(provide 'init-auto-complete)

