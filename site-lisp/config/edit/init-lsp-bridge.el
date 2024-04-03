;;; Require
;;; Code:
(require 'lsp-bridge)
(require 'lsp-bridge-jdtls)

;; 指定语言使用的服务器
(setq lsp-bridge-python-lsp-server "pyright")
(setq lsp-bridge-user-langserver-dir "~/.emacs.d/site-lisp/lsp-config")
(setq lsp-bridge-python-command "~/.emacs.d/site-lisp/extensions/emacs-python/python.exe")

(setq lsp-bridge-enable-completion-in-minibuffer t)
(setq lsp-bridge-enable-hover-diagnostic t)
(setq lsp-bridge-signature-show-function 'lsp-bridge-signature-show-with-frame)
(setq acm-enable-quick-access t)
(setq acm-backend-yas-match-by-trigger-keyword t)
(setq acm-enable-tabnine nil)
(setq acm-enable-codeium nil)

(setq lsp-bridge-get-multi-lang-server-by-project
      (lambda (project-path filepath)
        ;; If typescript file include deno.land url, then use Deno LSP server.
        (save-excursion
          (when (string-equal (file-name-extension filepath) "ts")
            (dolist (buf (buffer-list))
              (when (string-equal (buffer-file-name buf) filepath)
                (with-current-buffer buf
                  (goto-char (point-min))
                  (when (search-forward-regexp (regexp-quote "from \"https://deno.land") nil t)
                    (return "deno")))))))))

;; Support jump to define of EAF root from EAF application directory.
(setq lsp-bridge-get-project-path-by-filepath
      (lambda (filepath)
        (when (string-prefix-p (expand-file-name "~/.emacs.d/site-lisp/extensions/emacs-application-framework/app") filepath)
          (expand-file-name "~/.emacs.d/site-lisp/extensions/emacs-application-framework/"))))

(defun xfw-lsp-mode()
  (interactive)
  (require 'init-python-path)
  (xfw-load-lsp)
  (lsp-bridge-mode))



(provide 'init-lsp-bridge)
