(require 'magit)
(setq magit-git-executable "D:/GreenSoftware/Scoop/apps/git/current/bin/git.exe")
(pretty-hydra-define vc-hydra
  (:color amaranth :quit-key "q" :title (pretty-hydra-title "Version Control" 'faicon "nf-fa-github_alt"))
  ("Directory"
   (("d" vc-dir "vc dir" :exit t)
    ("m" vc-dir-mark "vc dir mark" :exit t)
    )
   "File"
   (("f" vc-dir-find-file "vc dir find fil" :exit t))
   "Operation"
   (("p" vc-push "vc push" :exit t)
    ("P" vc-pull "vc pull" :exit t)
    ("M" vc-merge "vc merge" :exit t)
    )
   ))
(provide 'init-vc)
