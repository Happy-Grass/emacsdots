
(defun eshell/clear ()
  (let ((eshell buffer maximum lines 0))
    (eshell-truncate-buffer)))
(provide 'init-eshell)
