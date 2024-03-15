(require 'avy)
(require 'ace-pinyin)
(require 'ace-popup-menu)

(ace-pinyin-global-mode +1)
(define-key evil-normal-state-map (kbd "s") 'avy-goto-char)
(define-key evil-normal-state-map (kbd "S") 'avy-goto-char-2)
(ace-popup-menu-mode 1)
(provide 'init-ace)
