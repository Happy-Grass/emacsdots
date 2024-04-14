(require 'helpful)
(pretty-hydra-define help-hydra
 (:title (pretty-hydra-title "Help Commands" 'mdicon "nf-md-scan_helper") :quit-key ("q" "C-g"))
  ("Helpful"
   (("v" helpful-variable "variable" :exit t)
    ("k" helpful-key "key" :exit t)
    ("f" helpful-function "function" :exit t)
    ("c" helpful-callable "callable" :exit t)
    ("x" helpful-command "command" :exit t)
    ("s" helpful-symbol "symbol" :exit t)
    ("a" helpful-macro "macro" :exit t)
    ("m" describe-mode "describe mode" :exit t))
   "Manuals"
   (("r" info-emacs-manual "show emacs manual" :exit t)
    ("i" info "show installed manual" :exit t)
    ("R" info-display-manual "show specific manual" :exit t))
   "Other"
   (("e" view-echo-area-messages "recent messages" :exit t)
    ("l" view-lossage "last input" :exit t)
    ("." display-local-help "local help" :exit t)
    )
   ))
(provide 'init-help)
