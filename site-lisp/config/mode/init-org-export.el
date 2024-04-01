;; 使用xelatex，配合当前org文件最开始的配置来正常输出中文
  ;; 这类笔记基本不可能是全英文，所以就安心用xelatex算了
(setq org-latex-pdf-process '("xelatex -file-line-error -interaction nonstopmode -output-directory %o %f"
                              "bibtex %b"
                              "xelatex -file-line-error -interaction nonstopmode -output-directory %o %f"
                              "xelatex -file-line-error -interaction nonstopmode -output-directory %o %f"))

(setq org-latex-inputenc-alist '(("utf8" . "utf8x")));;导出tex使用utf-8编码
;; 生成PDF后清理辅助文件
;; https://answer-id.com/53623039
(setq org-latex-logfiles-extensions 
  (quote ("lof" "lot" "tex~" "tex" "aux" 
    "idx" "log" "out" "toc" "nav" 
    "snm" "vrb" "dvi" "fdb_latexmk" 
    "blg" "brf" "fls" "entoc" "ps" 
    "spl" "bbl" "xdv")))

;; 图片默认宽度
(setq org-image-actual-width '(300))

(setq org-export-with-sub-superscripts nil)

;; 不要自动创建备份文件
(setq make-backup-files nil)

;; elegantpaper.cls
;; https://github.com/ElegantLaTeX/ElegantPaper/blob/master/elegantpaper.cls
(with-eval-after-load 'ox-latex
;; http://orgmode.org/worg/org-faq.html#using-xelatex-for-pdf-export
;; latexmk runs pdflatex/xelatex (whatever is specified) multiple times
;; automatically to resolve the cross-references.
; (setq org-latex-pdf-process '("latexmk -xelatex -quiet -shell-escape -f %f"))
(setq org-latex-listings t)
(add-to-list 'org-latex-classes
              '("elegantpaper"
                "\\documentclass[lang=cn]{elegantpaper}
                [NO-DEFAULT-PACKAGES]
                [PACKAGES]
                [EXTRA]"
                ("\\section{%s}" . "\\section*{%s}")
                ("\\subsection{%s}" . "\\subsection*{%s}")
                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                ("\\paragraph{%s}" . "\\paragraph*{%s}")
                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  )
(provide 'init-org-export)
