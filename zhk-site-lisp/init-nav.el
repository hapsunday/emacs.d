;; Emacs mode for filesystem navigation

(add-to-list 'load-path (expand-file-name
                         "~/.emacs.d/site-lisp/emacs-nav-49"))
(require 'nav)
(nav-disable-overeager-window-splitting)
;; Optional: set up a quick key to toggle nav
(global-set-key [f8] 'nav-toggle)



(provide 'init-nav)
