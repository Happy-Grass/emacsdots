(require 'python)

;; 开发环境
(setq python-home "D:/Conda")
(defun xfw-python-mode-config ()
  (setq
   ;; 缩进长度4个空格
   python-indent 4
   ;; 使用空格而不是tab进行缩进
   indent-tabs-mode nil
   ;; 如果有tab的话就解释成4个空格
   default-tab-width 4

   ;; 设置 run-python 的参数，主要是python3解释器的路径，不然默认用的是python2
   python-shell-interpreter (concat python-home "/python3")
   python-shell-completion-native-enable nil
   py-python-command (concat python-home "/python3")
   exec-path (append exec-path '(python-home))
   python-shell-completion-native-disabled-interpreters '("python")))

;; 在每次进入python-mode的时候加载自定义的python开发环境
(add-hook 'python-mode-hook 'xfw-python-mode-config)


(provide 'init-python)
