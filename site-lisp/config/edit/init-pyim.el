(defvar load-pyim-xr nil)
(if (not load-pyim-xr)
    ;;解决和auctex中而xr.el文件冲突问题
    (progn
      (load "~/.emacs.d/site-lisp/extensions/xr/xr.el")
      (setq load-pyim-xr t)))
(require 'pyim)
(require 'pyim-basedict)
(require 'popup nil t)
(require 'posframe nil t)

(setq pyim-page-tooltip '(posframe popup minibuffer))
(setq pyim-page-style 'one-line)
(setq-default pyim-punctuation-translate-p '(no)) ;使用半角标点

(pyim-basedict-enable)
(setq default-input-method "pyim")
(setq pyim-page-length 7)
(pyim-default-scheme 'quanpin)

(defun toggle-pyim () ;;配置延迟加载预留函数
  (interactive)
  (toggle-input-method))

(defun my-orderless-regexp (orig-func component) ;; vertico支持拼音检索
  (let ((result (funcall orig-func component)))
    (pyim-cregexp-build result)))
(advice-add 'orderless-regexp :around #'my-orderless-regexp)


(provide 'init-pyim)
