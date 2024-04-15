;;(setenv "PATH" (concat "D:/GreenSoftware/Scoop/shims;" (getenv "PATH")))
(setenv "PATH" (concat "D:/GreenSoftware/Scoop/apps/git/current/bin;" (getenv "PATH")))
;;(setenv "PATH" (concat "D:/GreenSoftware/Scoop/apps/nodejs/current;" (getenv "PATH")))
(setenv "PATH" (concat "C:/texlive/2023/bin/windows;" (getenv "PATH")))
(setenv "PATH" (concat "C:/Program Files/IrfanView;" (getenv "PATH")))
(setenv "PATH" (concat "D:/GreenSoftware/Scoop/apps/ImageMagick/current;" (getenv "PATH")))
;;(setenv "PATH" (concat "D:/GreenSoftware/Scoop/apps/flameshot/current/bin;" (getenv "PATH")))
;;(setenv "PATH" (concat "C:/Windows/System32/OpenSSH;" (getenv "PATH")))
(setenv "PATH" (concat (expand-file-name "~") "/.emacs.d/site-lisp/win_software/plink;" (getenv "PATH")))
(setenv "PATH" (concat (expand-file-name "~") "/.emacs.d/site-lisp/win_software/base64;" (getenv "PATH")))
(setenv "PATH" (concat (expand-file-name "~") "/.emacs.d/site-lisp/win_software/ripgrep;" (getenv "PATH")))
;; curl for chatgpt shell 和chatgpt-shell有点不兼容,后面在看
;;(setenv "PATH" (concat (expand-file-name "~") "/.emacs.d/site-lisp/win_software/emacs-curl/bin;" (getenv "PATH")))
(setenv "PATH" (concat (expand-file-name "~") "/.emacs.d/site-lisp/win_software/emacs-cmake/bin;" (getenv "PATH")))
(setenv "PATH" (concat (expand-file-name "~") "/.emacs.d/site-lisp/win_software/emacs-mingw64/bin;" (getenv "PATH")))
(setenv "GIT_INSTALL_ROOT" "D:/GreenSoftware/Scoop/apps/git/current")

(setq exec-path (split-string (getenv "PATH") ";"))

(provide 'init-env)
