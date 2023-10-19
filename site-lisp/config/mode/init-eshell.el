
(defun eshell/clear ()
  (let ((eshell buffer maximum lines 0))
    (eshell-truncate-buffer)))

(setq exec-path (split-string (getenv "PATH") ";"))

(provide 'init-eshell)
