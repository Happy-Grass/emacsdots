(require 'pyim)
(require 'pyim-basedict)

(require 'popup nil t)
(setq pyim-page-tooltip 'popup)

(pyim-basedict-enable)
(setq default-input-method "pyim")
(setq pyim-page-length 5)
(pyim-default-scheme 'quanpin)
(provide 'init-pyim)
