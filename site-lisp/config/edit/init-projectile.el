;;;package --- config for projectile:
;;;Code:
(require 'projectile)

(setq projectile-project-search-path
      (list
       '("D:/Gitlocal" . 1)
       (cons (concat xfw-notes-home "/latex")  1)))
(setq projectile-switch-project-action #'projectile-find-file)
(projectile-mode +1)
(pretty-hydra-define projectile-hydra
  (:title (pretty-hydra-title "Projects Commands" 'sucicon "nf-seti-project" )
	  :color blue :quit-key ("q" "C-g"))
  ("Projects"
   (("s" projectile-switch-project "switch" :exit t)
    ("R" projectile-remove-know-project "remove" :exit t)
    ("a" projectile-add-know-project "add" :exit t)
    ("l" projectile-invalidate-cache "reload" :exit t)
    ("w" projectile-ripgrep  "find-word" :exit t))
   "Find"
   (("d" dired-sidebar-toggle-sidebar "dired" :exit t)
    ("ff" projectile-find-file "find-file" :exit t)
    ("fo" projectile-find-other-file "find-other-file" :exit t)
    ("ft" projectile-find-test-file "find-test-file" :exit t)
    ("fr" projectile-find-related-file "find-related-file" :exit t)
    ("fm" projectile-find-file-dwim "find-file-dwim" :exit t)
    ("fa" projectile-find-tag "find-tag" :exit t)
    ("fe" projectile-find-reference "find-reference" :exit t)
    ("fw" projectile-ripgrep  "find-word" :exit t))
   "Command"
   (("e" projectile-run-eshell "eshell" :exit t)
    ("cm" projectile-compile-project "compile" :exit t)
    ("cc" projectile-configure-project "configure" :exit t)
    ("rc" projectile-run-command-in-root "run command" :exit t)
    ("rs" projectile-run-shell "shell" :exit t)
    ("re" projectile-run-eshell "eshell" :exit t)
    ("rg" projectile-run-gdb "gdb" :exit t)
    )
    
  ))
(provide 'init-projectile)
