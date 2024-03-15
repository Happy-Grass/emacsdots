(require 'pdf-tools)
(require 'pdf-loader)
(require 'pdf-occur)
(require 'pdf-annot)
(setq pdf-info-epdfinfo-program "~/.emacs.d/site-lisp/extensions/epdfinfo-compiled/epdfinfo.exe")
(pdf-loader-install)
(add-hook 'pdf-view-mode-hook (lambda () (display-line-numbers-mode -1)))

(defun pdf-view-kill-rmn-ring-save ()
  "Copy the region to the `kill-ring' after remove all newline characters."
  (interactive)
  (pdf-view-assert-active-region)
  (let* ((txt (replace-regexp-in-string "\n" " "
        (car (pdf-view-active-region-text)))))
    (pdf-view-deactivate-region)
	(kill-new txt)))
