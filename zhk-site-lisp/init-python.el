;; init python related settings


(add-to-list 'load-path (expand-file-name
                         "~/.emacs.d/site-lisp/python-stuff"))
(require 'pymacs)
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")
;;(eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")

(setq py-install-directory "~/.emacs.d/site-lisp/python-stuff/python-mode.el-6.1.1")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)
(setq py-load-pymacs-p t)

;; (add-hook 'python-mode-hook 'highlight-indentation-mode)

;; http://chrispoole.com/project/ac-python/
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/python-stuff/")
;; (require 'ac-python)

(provide 'init-python)

