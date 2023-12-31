(load "auctex.el" nil t t)
(require 'font-latex)
(require 'preview)
(require 'cdlatex)
(add-hook 'LaTeX-mode-hook #'turn-on-cdlatex)
(add-hook 'latex-mode-hook #'turn-on-cdlatex)
(setq Tex-auto-save t)
(setq Tex-parse-self t)
(setq-default Tex-master nil)
(provide 'init-tex)
