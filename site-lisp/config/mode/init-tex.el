(require 'auctex)
;;(require 'preview-latex)
(require 'font-latex)
(require 'preview)
(require 'cdlatex)
(require 'xenops) ;; use for preview equation
(setq xenops-math-image-scale-factor 0.4)
(setq org-format-latex-header
"\\documentclass{article}
\\usepackage[usenames]{color}
[DEFAULT-PACKAGES]
[PACKAGES]
\\pagestyle{empty}             % do not remove
\\usepackage{amsmath}
% The settings below are copied from fullpage.sty
\\setlength{\\textwidth}{\\paperwidth}
\\addtolength{\\textwidth}{-3cm}
\\setlength{\\oddsidemargin}{1.5cm}
\\addtolength{\\oddsidemargin}{-2.54cm}
\\setlength{\\evensidemargin}{\\oddsidemargin}
\\setlength{\\textheight}{\\paperheight}
\\addtolength{\\textheight}{-\\headheight}
\\addtolength{\\textheight}{-\\headsep}
\\addtolength{\\textheight}{-\\footskip}
\\addtolength{\\textheight}{-3cm}
\\setlength{\\topmargin}{1.5cm}
\\addtolength{\\topmargin}{-2.54cm}")

(add-hook 'LaTeX-mode-hook #'turn-on-cdlatex)
(setq Tex-auto-save t)
(setq Tex-parse-self t)
(setq-default Tex-master nil) 
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view)))
(add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex -synctex=1 %(mode)%' %t" TeX-run-TeX nil t))
(setq TeX-command-default "XeLaTeX")

(setq pdf-sync-backward-display-action t
      pdf-sync-forward-display-action t
      TeX-source-correlate-mode t
      TeX-source-correlate-method '(
                                    (dvi . source-specials)
                                    (pdf . synctex))
      TeX-source-correlate-start-server t  ;; [C-c C-g] to switch between source code and PDF
      reftex-plug-into-AUCTeX t)
(add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer) ; 

(major-mode-hydra-define LaTeX-mode
 (:title (pretty-hydra-title "TeX Commands" 'sucicon "nf-seti-tex") :color amaranth :quit-key ("q" "C-g"))
 ("Edit"
  (("s" LaTeX-section "section" :exit t)
   ("e" LaTeX-environment "environment" :exit t)
   ("m" TeX-insert-macro "macro" :exit t)
   ("f" TeX-font "font" :exit t))
  "Compile"
  (("ca" TeX-command-run-all "compile-all" :exit t)
   ("cm" TeX-command-master "command-master" :exit t)
   ("cb" TeX-command-buffer "command-buffer" :exit t)
   ("cr" TeX-command-region "command-region" :exit t)
   ("g" pdf-view-goto-label "go to label" :exit t)
   ("y" pdf-view-kill-rmn-ring-save "copy text" :exit t)
   )
  "Notes"
  (("N" noter-open "noter" :exit t)
   ("i" org-noter-insert-note "insert note" :exit t)
   ("I" org-noter-insert-precise-note "insert precise note" :exit t)
   ("p" org-noter-sync-prev-note "sync pre" :exit t)
   ("n" org-noter-sync-next-note "sync next" :exit t)
   )
  "Format"
  (("F" LaTeX-fill-buffer "format" :exit t)
   ("O" pdf-occur-next-error "next occur")
   )
 ))


(provide 'init-tex)
