(require 'window-purpose)
(purpose-mode)
;; python layout
(add-to-list 'purpose-user-mode-purposes '(python-ts-mode . py))
(add-to-list 'purpose-user-mode-purposes '(python-mode . py))
(add-to-list 'purpose-user-mode-purposes '(inferior-python-mode . py-repl))


(add-to-list 'purpose-user-mode-purposes '(pdf-view-mode . pdf))
(add-to-list 'purpose-user-mode-purposes '(org-mode . note))
(purpose-compile-user-configuration)
(provide 'init-wm.el)
