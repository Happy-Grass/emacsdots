(require 'evil-find-char-pinyin)
(evil-mode 1)
(evil-find-char-pinyin-mode +1) ;; evil-mode的f/F/t/T支持拼音模式
(evil-set-initial-state 'ebib-index-mode 'emacs)
(evil-set-initial-state 'ebib-entry-mode 'emacs)
(evil-set-initial-state 'ebib-strings-mode 'emacs)
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-normal-state-map (kbd "g j") 'evil-next-line)
(define-key evil-normal-state-map (kbd "g k") 'evil-previous-line)
(provide 'init-evil)

