;; 设置代码折叠配置

(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'python-mode-hook     'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)

(defun zhk-set-code-fold-toggle ()
  (define-key hs-minor-mode-map "\C-zh" 'hs-toggle-hiding)
  (define-key hs-minor-mode-map "\C-ch" 'hs-toggle-hiding)
  )
(add-hook 'hs-minor-mode-hook 'zhk-set-code-fold-toggle)

;; ============================================================
;; code folding
(defun aj-toggle-fold ()
  "Toggle fold all lines larger than indentation on current line"
  (interactive)
  (let ((col 1))
    (save-excursion
      (back-to-indentation)
      (setq col (+ 1 (current-column)))
      (set-selective-display
       (if selective-display nil (or col 1))))))
(global-set-key [(M C i)] 'aj-toggle-fold)


(provide 'init-code-folding)

