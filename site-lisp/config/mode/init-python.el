(setq conda-anaconda-home "D:/Conda")
(require 'python)
(require 'conda)

(setq
   ;; 缩进长度4个空格
   python-indent 4
   ;; 使用空格而不是tab进行缩进
   indent-tabs-mode nil
   ;; 如果有tab的话就解释成4个空格
   default-tab-width 4
   python-shell-completion-native-enable nil)


(defun track-python-venv-for-pyright (filepath)
  "filepath为pyright的配置文件路径,函数用于修改pyright的配置文件,实现conda切换虚拟环境的补全"
  (let* ((json-object-type 'plist)
	 (default-config (json-read-file filepath))
	 (settings (plist-get default-config :settings))
	 )
    (plist-put settings :pythonPath (executable-find "python"))
    (with-temp-file filepath
      (insert (json-encode default-config)))
    (message "Rewrite %s" filepath)
  ))

(defun change-pyright-json-with-conda ()
    (track-python-venv-for-pyright "~/.emacs.d/site-lisp/lsp-config/pyright-background-analysis.json")
  )

(defun change-python-interpreter-with-conda ()
  "根据conda环境改变python的interpreter"
  (setq python-shell-interpreter (concat conda-env-current-path "/python.exe"))
  )
(add-hook 'conda-postactivate-hook 'change-python-interpreter-with-conda)
(add-hook 'conda-postactivate-hook 'change-pyright-json-with-conda)
   
(conda-env-activate "base")
(major-mode-hydra-define python-mode
 (:title (pretty-hydra-title "Python Commands" 'faicon "nf-fae-python") :color amaranth :quit-key ("q" "C-g"))
 ("Run code"
  (
   ("o" run-python "open shell" :exit t)
   ("f" python-shell-send-file "file" :exit t)
   ("b" python-shell-send-buffer "buffer" :exit t)
   ("r" python-shell-send-region "region" :exit t)
   ("d" python-shell-send-defun "defun" :exit t)
   ("s" python-shell-send-string "string" :exit t))
  "Conda"
  (("a" conda-env-activate "conda activate" :exit t)
   ("e" conda-env-deactivate "conda deactivate" :exit t)
   )
 ))


(major-mode-hydra-define python-ts-mode
 (:title (pretty-hydra-title "Python Commands" 'faicon "nf-fae-python") :color amaranth :quit-key ("q" "C-g"))
 ("Run code"
  (
   ("o" run-python "open shell" :exit t)
   ("f" python-shell-send-file "file" :exit t)
   ("b" python-shell-send-buffer "buffer" :exit t)
   ("r" python-shell-send-region "region" :exit t)
   ("d" python-shell-send-defun "defun" :exit t)
   ("s" python-shell-send-string "string" :exit t))
  "Conda"
  (("a" conda-env-activate "conda activate" :exit t)
   ("e" conda-env-deactivate "conda deactivate" :exit t)
   )
 ))

(provide 'init-python)
