(defun replace-path (new-string)
  (interactive "sEnter the new string: ")
  (let ((file "~/.emacs.d/site-lisp/extensions/emacs-python/python311._pth")
        (lines (with-temp-buffer
                 (insert-file-contents "~/.emacs.d/site-lisp/extensions/emacs-python/python311._pth")
                 (split-string (buffer-string) "\n" t))))
    (when (>= (length lines) 2)
      (setf (nth 1 lines) new-string)
      (with-temp-file file
        (insert (mapconcat 'identity lines "\n"))))))

(defun xfw-load-eaf ()
  (interactive)
  (replace-path (expand-file-name "~/.emacs.d/site-lisp/extensions/emacs-application-framework"))
  (message "Load eaf module!"))


(defun xfw-load-lsp ()
  (interactive)
  (replace-path (expand-file-name "~/.emacs.d/site-lisp/extensions/lsp-bridge"))
  (message "Load lsp-module!"))


(defun xfw-load-hololayer ()
  (interactive)
  (replace-path (expand-file-name "~/.emacs.d/site-lisp/extensions/holo-layer"))
  (message "Load hololayer module!"))

(provide 'init-python-path)
