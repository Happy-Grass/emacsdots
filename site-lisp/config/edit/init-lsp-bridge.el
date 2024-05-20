;;; Require
;;; Code:
(require 'lsp-bridge)
(require 'lsp-bridge-jdtls)

;; 指定语言使用的服务器
(setq lsp-bridge-python-lsp-server "pyright")
(setq lsp-bridge-user-langserver-dir "~/.emacs.d/site-lisp/lsp-config")
(setq lsp-bridge-python-command "~/.emacs.d/site-lisp/win_software/emacs-python/python.exe")
(setq lsp-bridge-c-lsp-server "clangd")

(setq lsp-bridge-enable-completion-in-minibuffer t)
(setq lsp-bridge-enable-hover-diagnostic t)
(setq lsp-bridge-signature-show-function 'lsp-bridge-signature-show-with-frame)
(setq acm-enable-quick-access t)
(setq acm-backend-yas-match-by-trigger-keyword t)
(setq acm-enable-tabnine nil)
(setq acm-enable-codeium nil)

(setq lsp-bridge-remote-file-port 8787)
(setq lsp-bridge-enable-with-tramp t
      lsp-bridge-remote-start-automatically t
      lsp-bridge-remote-python-command "python3"
      lsp-bridge-remote-python-file "/home/lsp-server/lsp-bridge/lsp_bridge.py"
      lsp-bridge-remote-log "/home/lsp-server/lbr_log.txt")


(defun xfw-lsp-mode()
  (interactive)
;;  (require 'init-python-path)
;;  (xfw-load-lsp)
  (lsp-bridge-mode))



(provide 'init-lsp-bridge)
