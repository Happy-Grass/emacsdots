(require 'vundo)
(pretty-hydra-define vundo-hydra
  (:color amaranth  :title (pretty-hydra-title "Undo" 'faicon "nf-fa-undo"))
  ("Undo"
   (("h" vundo-forward "forward")
    ("l" vundo-backward "backward")
    ("n" vundo-next "next")
    ("p" vundo-previous "previous"))
   "Branch"
    (("a" vundo-stem-root "stem root")
     ("e" vundo-stem-end "stem end"))
   "Saved"
    (("l" vundo-goto-last-saved "last saved")
     ("r" vundo-goto-next-saved "next saved"))
   "Mark"
    (("m" vundo-diff-mark "diff mark")
     ("u" vundo-diff-unmark "diff unmark")
     ("d" vundo-diff "diff show"))
    "Quit"
    (("q" vundo-quit "close vundo and quit" :exit t))
   ))
(defun hydra-undo ()
  (interactive)
  (vundo)
  (vundo-hydra/body)
)
(provide 'init-vundo)
