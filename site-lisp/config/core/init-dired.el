(require 'nerd-icons)
(require 'nerd-icons-dired)
(require 'dired-sidebar)
(add-hook 'dired-mode-hook #'nerd-icons-dired-mode)

;; config for dired-sidebar
(push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
(push 'rotate-windows dired-sidebar-toggle-hidden-commands)

(setq dired-sidebar-theme 'icons)
(setq dired-sidebar-use-term-integration t)
(setq dired-sidebar-width 25)


(put 'dired-find-alternate-file 'disable nil)
(define-key dired-mode-map (kbd "RET") 'find-alternate-file)
(define-key dired-mode-map (kbd "<return>") 'find-alternate-file)
(provide 'init-dired)
