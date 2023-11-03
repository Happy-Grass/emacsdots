(require 'deadgrep) ;; to use deadgrep, spinner needed to be installed, and ripgrep to install to the pc.

(pretty-hydra-define find-hydra
  (:title (pretty-hydra-title "Find Commands" 'mdicon "nf-md-file_find" )
	  :color blue :quit-key ("q" "C-g"))
  ("File"
   (("f" find-file "find-file" :exit t)
    ("w" deadgrep  "find-word" :exit t)
    ))
  )
(provide 'init-find)
