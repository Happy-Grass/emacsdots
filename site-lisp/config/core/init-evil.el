(require 'evil-leader)
(evil-leader/set-leader ",")
(global-evil-leader-mode)
(evil-mode 1)
(evil-set-initial-state 'ebib-index-mode 'emacs)
(evil-set-initial-state 'ebib-entry-mode 'emacs)
(evil-set-initial-state 'ebib-strings-mode 'emacs)
(provide 'init-evil)

