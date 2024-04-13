(require 'perspective)
(customize-set-variable 'persp-mode-prefix-key (kbd "C-c M-p"))
(setq persp-state-default-file "~/.emacs.d/perspective")
(if (file-exists-p "~/.emacs.d/perspective")
		   (progn
		     (persp-state-restore "~/.emacs.d/perspective")
		     )
		   (persp-mode))

(pretty-hydra-define perspective-hydra
  (:color amaranth :quit-key ("q" "C-g")  :title (pretty-hydra-title "Session Commands" 'octicon "nf-oct-codespaces"))
  ("Session"
   (("s" persp-switch "switch" :exit t)
    ("c" persp-kill "delete" :exit t)
    ("i" persp-import "import from frame" :exit t)
    ("S" persp-state-save "save persps(file)" :exit t)
    ("l" persp-state-restore "restore persps(file)" :exit t)
    ("r" persp-rename "rename" :exit t))
   "Buffer"
   (("k" persp-remove-buffer "remove" :exit t)
    ("a" persp-add-buffer "add" :exit t)
    ("A" persp-set-buffer "add(current) mv(others)" :exit t)
    ("m" persp-merge "merge buflists" :exit t)
    ("u" persp-unmerge "unmerge" :exit t)
    ("b" persp-switch-to-buffer "switch" :exit t))
   ))
;; 还是禁用自动保存吧,改为手动加载
;;(add-hook 'kill-emacs-hook #'persp-state-save)
(provide 'init-perspective)
