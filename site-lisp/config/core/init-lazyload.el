;; before loading init-lazyload, init-evil.el must be loaded first
(require 'lazy-load)
(require 'evil-leader)

(global-set-key (kbd "C-c m") #'major-mode-hydra)
(defun lazy-load-evil-leader-keys (key funcname filename &optional)
  "关联evil的lazyload"
  (evil-leader/set-key key funcname)
  (autoload funcname filename nil t))

(lazy-load-evil-leader-keys "n" 'org-roam-hydra/body "init-org")
(lazy-load-evil-leader-keys "b" 'bookmark-hydra/body "init-bookmark")
(lazy-load-evil-leader-keys "v" 'vc-hydra/body "init-vc")
(lazy-load-evil-leader-keys "e" 'ebib "init-ebib")
(lazy-load-evil-leader-keys "f" 'find-hydra/body "init-find")

;; 输入法加载
(lazy-load-global-keys
 '(("C-\\" . toggle-pyim))
 "init-pyim")

;; 快捷选项,加载的文件还需要配置
(lazy-load-global-keys
 '(("<f1>" . global-toggles/body))
 "init-hydra")

(setq lsp-status nil)
(lazy-load-global-keys
 '(("<f2>" . lazyload-lsp))
 "init-lsp-bridge")

(defun lazyload-eshell-setup()
  (require 'init-eshell))
(add-hook 'eshell-mode-hook 'lazyload-eshell-setup)


(defun lazyload-python-setup()
  (require 'init-python))

(defvar auctex-loadp nil)
(defun auctex-lazyload()
  (if (not auctex-loadp)
      (progn
	(require 'init-tex)
	(setq auctex-loadp t)
	(message "init-tex.el loaded"))
    (message "init-tex.el has been loaded, nothing to do！"))
  )
;;(add-hook 'python-mode-hook 'lazyload-python-setup)
;;(add-hook 'python-ts-mode-hook 'lazyload-python-setup)
(add-hook 'tex-mode-hook 'auctex-lazyload)
(add-hook 'latex-mode-hook 'auctex-lazyload)


(provide 'init-lazyload)
