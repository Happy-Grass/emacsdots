(require 'vundo)
(pretty-hydra-define vundo-hydra
  (:color amaranth  :title (pretty-hydra-title "Undo" 'faicon "nf-fa-undo"))
  ("Undo"
   (("h" vundo-forward "forward")
    ("l" vundo-backward "backward")
    ("n" vundo-next "next")
    ("p" vundo-previous "previous")
    ("<RET>" vundo-confirm "confirm" :exit t))
   "Branch"
    (("a" vundo-stem-root "stem root")
     ("e" vundo-stem-end "stem end"))
   "Saved"
    (("l" vundo-goto-last-saved "last saved")
     ("r" vundo-goto-next-saved "next saved"))
    "Quit"
    (("q" vundo-quit "close vundo" :exit t)
     ("C-g" vundo-quit "close vundo" :exit t)
     )
   ))
(defun hydra-undo ()
  (interactive)
  (vundo)
  (vundo-hydra/body)
)
(provide 'init-vundo)
