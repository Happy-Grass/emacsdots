(setenv "PATH" (concat "D:/GreenSoftware/Scoop/shims;" (getenv "PATH")))
(setenv "PATH" (concat "D:/GreenSoftware/Scoop/apps/git/current/bin;" (getenv "PATH")))
(setenv "PATH" (concat "D:/GreenSoftware/Scoop/apps/nodejs/current;" (getenv "PATH")))
(setenv "PATH" (concat "C:/texlive/2023/bin/windows;" (getenv "PATH")))

(setenv "GIT_INSTALL_ROOT" "D:/GreenSoftware/Scoop/apps/git/current")

(setq exec-path (split-string (getenv "PATH") ";"))

(provide 'init-env)
