(require 'tex)
(load "auctex.el" nil t t)
(setq Tex-auto-save t)
(setq Tex-parse-self t)
(setq-default Tex-master nil)

(add-hook 'Latex-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(setq TeX-PDF-mode t)
(setq Tex-source-correlate-mode t)
(setq Tex-source-correlate-method 'synctex)
(setq Tex-view-program-selection '((output-pdf "PDF Tools")))
(setq Tex-view-program-list '(("PDF Tools" Tex-pdf-tools-sync-view)))
(provide 'init-tex)
