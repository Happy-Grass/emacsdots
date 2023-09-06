(setenv "ANACONDA_HOME" "D:/Conda")
(require 'python)
(require 'conda)
;; if you want interactive shell support, include:
(conda-env-initialize-interactive-shells)
;; if you want eshell support, include:
(conda-env-initialize-eshell)
;; if you want auto-activation (see below for details), include:
(conda-env-autoactivate-mode t)
;; if you want to automatically activate a conda environment on the opening of a file:
;(add-to-hook 'find-file-hook (lambda () (when (bound-and-true-p conda-project-env-path)
(conda-env-activate "base")
(setq
   ;; 缩进长度4个空格
   python-indent 4
   ;; 使用空格而不是tab进行缩进
   indent-tabs-mode nil
   ;; 如果有tab的话就解释成4个空格
   default-tab-width 4

   ;; 设置 run-python 的参数，主要是python3解释器的路径，不然默认用的是python2
   python-shell-interpreter (concat python-shell-virtualenv-path "/python.exe")
   python-shell-completion-native-enable nil
   python-shell-completion-native-disabled-interpreters '("python.exe"))

(provide 'init-python)
