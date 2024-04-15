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
(require 'pyim-tsinghua-dict)
(require 'pyim-cstring-utils);; 添加中文分词功能


(setq pyim-page-tooltip '(posframe popup minibuffer))
(setq pyim-page-style 'two-lines)
(setq-default pyim-punctuation-translate-p '(auto)) ;根据输入法自动选取全角半角标点

;;配置pyim翻页的快捷键
(define-key pyim-mode-map "]" 'pyim-page-next-page)
(define-key pyim-mode-map "[" 'pyim-page-previous-page)
(define-key evil-normal-state-map (kbd "b") 'pyim-backward-word)
(define-key evil-normal-state-map (kbd "w") 'pyim-forward-word)

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

(pyim-tsinghua-dict-enable) ;; 添加清华字典

(provide 'init-pyim)
