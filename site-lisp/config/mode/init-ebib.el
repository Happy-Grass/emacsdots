(require 'init-setting)
(require 'ebib)
(require 'ebib-biblio)
(define-key ebib-index-mode-map (kbd "B") #'ebib-biblio-import-doi)
(define-key biblio-selection-mode-map (kbd "e") #'ebib-biblio-selection-import)
(setq ebib-bibtex-dialect "biblatex"
      ebib-default-directory (concat xfw-notes-home "/ebib")
      ebib-bib-search-dirs (concat xfw-notes-home "/ebib/bib")
      ebib-file-search-dirs (list (concat xfw-notes-home "/ebib/pdf"))
      ebib-notes-directory (concat xfw-notes-home "/roam/article")
      ebib-extra-fields '((biblatex "crossref" "xdata" "annotation" "abstract" "keywords" "file" "timestamp")
		        (BibTeX "crossref" "annote" "abstract" "keywords" "file" "if" "timestamp" "url" "doi" "issn"))
      ebib-preload-bib-files (list (concat xfw-notes-home "/ebib/bib/default.bib"))
      ebib-citation-insert-multiple t
      ebib-file-associations nil ;;不设置外部程序,默认用pdf-tools打开
      ;; 配置auto-generate-key
      bibtex-autokey-expand-strings t
      bibtex-autokey-year-length 4
      bibtex-autokey-year-title-separator "_")
(setq ebib-index-columns
      '( ("Entry Key" 40 t) 
	("Author/Editor" 20 t)
;;	("Year" 6 t)
	("if" 4 t)
	("Title" 100 t)
	))

(add-to-list 'ebib-citation-commands
	     '(LaTeX-mode
	       (("cite" "\\cite%<[%A]>[%A]{%(%K%,)}")
	        ("super" "\\supercite{%K}"))))
(provide 'init-ebib)
