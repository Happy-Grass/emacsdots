;; before loading init-lazyload, init-evil.el must be loaded first
;; preload function names
(autoload 'help-hydra/body "init-help" nil t)
(autoload 'ebib "init-ebib" nil t)
(autoload 'bookmark-hydra/body "init-bookmark" nil t)
(autoload 'projectile-hydra/body "init-projectile" nil t)
(autoload 'hydra-undo "init-vundo" nil t)
(autoload 'org-roam-hydra/body "init-org" nil t)
(autoload 'vc-hydra/body "init-vc" nil t)
(autoload 'chatgpt-hydra/body "init-chatgpt" nil t)
(autoload 'window-hydra/body "init-window" nil t)
(autoload 'tools-hydra/body "init-tools" nil t)
(autoload 'perspective-hydra/body "init-perspective" nil t)
(autoload 'find-hydra/body "init-find" nil t)
(autoload 'toggle-pyim "init-pyim" nil t)
(autoload 'elfeed "init-elfeed" nil t)
(autoload 'xfw-lsp-mode "init-lsp-bridge" nil t)

;; short key
(pretty-hydra-define global-hydra
 (:title (pretty-hydra-title "Global Commands" 'faicon "nf-fa-globe") :quit-key ("q" "C-g"))
  ("Manager"
   (("e" ebib "ebib" :exit t)
    ("b" bookmark-hydra/body "bookmark" :exit t)
    ("v" vc-hydra/body "git" :exit t)
    ("f" find-hydra/body "find" :exit t)
    ("s" perspective-hydra/body "session" :exit t)
    ("p" projectile-hydra/body "projectile" :exit t))
   "Edit"
   (
    ("m" major-mode-hydra "major" :exit t)
    ("n" org-roam-hydra/body "roam" :exit t)
    ("t" tools-hydra/body "tools" :exit t)
    ("u" hydra-undo "undo" :exit t))
   "Shell"
   (("a" chatgpt-hydra/body "chatgpt" :exit t))
   "Window"
   (("w" window-hydra/body "window" :exit t)
    ("o" popper-hydra/body "popper" :exit t))
   ))


(global-set-key (kbd "C-h") 'help-hydra/body)
(global-set-key (kbd "C-\\") 'toggle-pyim)
(global-set-key (kbd "C-,") 'global-hydra/body)
(global-set-key (kbd "<f1>") 'global-toggles/body)
(global-set-key (kbd "<f2>") 'xfw-lsp-mode)
(global-set-key (kbd "<f3>") 'elfeed)

(define-key evil-normal-state-map (kbd ",") 'global-hydra/body)

(add-hook 'eshell-mode-hook #'(lambda () (require 'init-eshell)))
(add-hook 'prog-mode-hook #'(lambda () (progn (require 'init-indent) (highlight-indent-guides-mode))))

(setq major-mode-remap-alist
      '((latex-mode . (lambda () (progn (require 'init-tex) (LaTeX-mode))))
	(org-mode . (lambda () (progn (require 'init-org) (org-mode))))
	(doc-view-mode-maybe . (lambda () (progn (require 'init-pdf) (pdf-view-mode))))))

(provide 'init-lazyload)
