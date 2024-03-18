(require 'ebib)
(require 'ebib-biblio)
(setq ebib-bibtex-dialect "biblatex")
(define-key ebib-index-mode-map (kbd "B") #'ebib-biblio-import-doi)
(define-key biblio-selection-mode-map (kbd "e") #'ebib-biblio-selection-import)
(setq ebib-default-directory "F:/BaiduSyncdisk/Notes/ebib")
(setq ebib-bib-search-dirs "F:/BaiduSyncdisk/Notes/ebib/bib")
(setq ebib-notes-directory "F:/BaiduSyncdisk/Notes/roam/article")
(setq ebib-file-search-dirs '("F:/BaiduSyncdisk/Notes/ebib/pdf"))
(setq ebib-extra-fields
      '((biblatex "crossref" "xdata" "annotation" "abstract" "keywords" "file" "timestamp")
	(BibTeX "crossref" "annote" "abstract" "keywords" "file" "if" "timestamp" "url" "doi" "issn")))
(setq ebib-index-columns
      '( ("Entry Key" 40 t) 
	("Author/Editor" 10 t)
	("Year" 6 t)
	("if" 4 t)
	("Title" 50 t)
	))
(setq ebib-preload-bib-files '("F:/BaiduSyncdisk/Notes/ebib/bib/default.bib"))
(setq ebib-citation-commands
      (quote ((org-mode (("cite" "\\cite{%K}"))))))
(setq ebib-citation-insert-multiple t)
(setq ebib-file-associations nil) ;;不设置外部程序,默认用pdf-tools打开
;; 配置auto-generate-key
(setq bibtex-autokey-expand-strings t)
(setq bibtex-autokey-year-length 4)
(setq bibtex-autokey-year-title-separator "_")
(provide 'init-ebib)
