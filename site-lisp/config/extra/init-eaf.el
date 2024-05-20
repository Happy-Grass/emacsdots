(setenv "PYTHONUSERBASE" (concat (expand-file-name "~") "/.emacs.d/site-lisp/win_software/python-packages"))
(setq eaf-python-command (concat (expand-file-name "~") "/.emacs.d/site-lisp/win_software/python-eaf/python.exe"))
(setq frame-title-format "Emacs")

;; 使用这个环境的pip
(setenv "PATH" (concat (expand-file-name "~") "/.emacs.d/site-lisp/win_software/python-eaf/Scripts;" (getenv "PATH")))
(setq exec-path (split-string (getenv "PATH") ";"))
(require 'eaf)
(require 'eaf-pdf-viewer)
(require 'eaf-git)
(require 'eaf-pyqterminal)
(setq eaf-pdf-dark-mode nil)
(require 'eaf-browser)
(setq eaf-webengine-default-zoom 2.0)
(require 'eaf-rss-reader)
(provide 'init-eaf)


