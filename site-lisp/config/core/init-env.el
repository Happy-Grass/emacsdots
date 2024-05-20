(setenv "PATH" (concat "D:/GreenSoftware/Scoop/apps/git/current/bin;" (getenv "PATH")))
(setenv "PATH" (concat "C:/texlive/2023/bin/windows;" (getenv "PATH")))
(setenv "PATH" (concat "C:/Program Files/IrfanView;" (getenv "PATH")))
(setenv "PATH" (concat "D:/GreenSoftware/Scoop/apps/ImageMagick/current;" (getenv "PATH")))
(setenv "PATH" (concat (expand-file-name "~") "/.emacs.d/site-lisp/win_software/plink;" (getenv "PATH")))
;;(setenv "PATH" (concat (expand-file-name "~") "/.emacs.d/site-lisp/win_software/base64;" (getenv "PATH")))
(setenv "PATH" (concat (expand-file-name "~") "/.emacs.d/site-lisp/win_software/ripgrep;" (getenv "PATH")))
;; curl for chatgpt shell 和chatgpt-shell有点不兼容,后面在看
;;(setenv "PATH" (concat (expand-file-name "~") "/.emacs.d/site-lisp/win_software/emacs-curl/bin;" (getenv "PATH")))
(setenv "PATH" (concat (expand-file-name "~") "/.emacs.d/site-lisp/win_software/emacs-cmake/bin;" (getenv "PATH")))
(setenv "PATH" (concat (expand-file-name "~") "/.emacs.d/site-lisp/win_software/emacs-mingw64/bin;" (getenv "PATH")))
(setenv "GIT_INSTALL_ROOT" "D:/GreenSoftware/Scoop/apps/git/current")

(setenv "PATH" (concat (expand-file-name "~") "/.emacs.d/site-lisp/win_software/emacs-clangd-windows/bin;" (getenv "PATH")))

(setenv "PATH" (concat "C:/WINDOWS/system32;" (getenv "PATH")))

;; 使用nodejs
(setenv "PATH" (concat (expand-file-name "~") "/.emacs.d/site-lisp/win_software/nodejs;" (getenv "PATH")))
(setenv "PATH" (concat "C:/Windows/System32/WindowsPowerShell/v1.0;" (getenv "PATH")))

(setq exec-path (split-string (getenv "PATH") ";"))


;; 定义python user－path的位置
(provide 'init-env)
