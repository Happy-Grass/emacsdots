(setq eaf-python-command "~/.emacs.d/site-lisp/extensions/emacs-python/python.exe")
(setq holo-layer-python-command "~/.emacs.d/site-lisp/extensions/emacs-python/python.exe")
(require 'holo-layer)
(setq holo-layer-enable-indent-rainbow t
      holo-layer-hide-mode-line t)
(holo-layer-enable)
(require 'eaf);; Need wmctrl
(require 'eaf-browser)
(provide 'init-eaf)

