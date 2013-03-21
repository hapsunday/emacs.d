
;; -----------------------------------------------------------
;; asymptote settings
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/asymptote"))
(autoload 'asy-mode "asy-mode.el" "Asymptote major mode." t)
(autoload 'lasy-mode "asy-mode.el" "hybrid Asymptote/Latex major mode." t)
(autoload 'asy-insinuate-latex "asy-mode.el" "Asymptote insinuate LaTeX." t)
(add-to-list 'auto-mode-alist '("\\.asy$" . asy-mode))
(if (eq system-type 'cygwin)
    (custom-set-variables
     '(asy-command-location "/usr/local/bin/") ;;"/usr/bin/")
     '(asy-command "zhk_run_asy.sh -f pdf -V "))
  ;; '(asy-command-location "/cygdrive/c/texlive/bin/i386-cygwin/"))
  (custom-set-variables
   '(asy-command-location "E:/Draw/Asymptote/"))
  )
;; (custom-set-variables
;;  '(asy-command-location "E:/Draw/Asymptote/"))
;; end asymptote settings
;; ------------------------------------------------------------

(provide 'init-asymptote)
