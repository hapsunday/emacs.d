;; 自定义顔色主题

(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/themes"))
(require 'color-theme)

(setq solarized-use-terminal-theme t)

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-blackboard)))
;; (color-theme-hober2))) ;;之前的主题

(provide 'init-color-theme)

