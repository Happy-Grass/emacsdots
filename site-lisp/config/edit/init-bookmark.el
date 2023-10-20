(pretty-hydra-define bookmark-hydra
  (:color amaranth :quit-key "q" :title (pretty-hydra-title "Bookmarks" 'mdicon "nf-md-bookmark_multiple"))
  ("Edit"
   (("c" bookmark-set "bookmark set" :exit t)
    ("d" bookmark-delete "bookmark delete" :exit t)
    ("r" bookmark-rename "bookmark rename" :exit t)
    ("D" bookmark-delete-all "bookmark delete all" :exit t))
   "Jump"
   (("j" bookmark-jump "bookmark jump" :exit t)
    ("k" bookmark-jump-other-window "bookmark jump other window" :exit t))
   "Save"
   (("s" bookmark-save "bookmark save" :exit t))
   "Load"
   (("l" bookmark-load "bookmark load" :exit t))
   ))
(provide 'init-bookmark)
