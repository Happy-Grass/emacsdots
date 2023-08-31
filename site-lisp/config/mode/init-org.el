(require 'org)
(require 'org-roam)


;; Agenda
(setq org-modules nil                 ; Faster loading
      org-directory xfw-org-roam-home
      org-todo-keywords
      '((sequence "TODO(t!)" "PROCESSING(p!)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELD(c@/!)")
        (sequence "⚑(T)" "🏴(P)" "❓(W)" "|" "✔(D)" "✘(C)"))
      org-todo-keyword-faces '(("WAIT" . warning)
                               ("❓" . warning))
      org-priority-faces '((?A . error)
                           (?B . warning)
                           (?C . success))
      
      ;; Agenda styling
      org-agenda-file-regexp "\\`[^.].*\\.org\\'"
      org-agenda-files (list (concat xfw-org-roam-home "/agenda/"))
      org-agenda-block-separator ?─
      org-agenda-time-grid
      '((daily today require-timed)
        (300 600 900 1200 1500 1800 2100 2400)
        " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
      org-agenda-current-time-string
      "⭠ now ─────────────────────────────────────────────────"
      
      org-tags-column -80
      org-log-done 'time
      org-catch-invisible-edits 'smart
      org-startup-indented t
      org-ellipsis (if (char-displayable-p ?⏷) "\t⏷" nil)
      org-pretty-entities nil
      org-hide-emphasis-markers t)

;; Org-roam
 (setq org-roam-directory (file-truename xfw-org-roam-home)
       org-roam-node-display-template (concat "${title:40} " (propertize "${tags:*}" 'face 'org-tag))
       org-roam-database-connector 'sqlite-builtin)

(unless (file-exists-p xfw-org-roam-home)
  (make-directory xfw-org-roam-home))

(setq org-roam-capture-templates
      '(
	("d" "contents" plain "%?"
	 :target (file+head "%<%Y%m%d%H>-${slug}.org"
			    "#+TITLE: ${title}\n#+AUTHOR: xfwahss\n#+DATE: %<%Y-%m-%d>\n#+FILETAGS: \n")
	 :unnarrowed t)
	("b" "book notes" plain "%?"
	 :target (file+head "book/book%<%Y%m%d%H>-${slug}.org"
			    "#+TITLE: ${title}\n#+AUTHOR: xfwahss\n#+DATE: %<%Y-%m-%d>\n#+FILETAGS: :bookreading: \n\n")
	 :unnarrowed t)
	
	("a" "article notes" plain "%?"
	 :target (file+head "article/${citekey}.org"
			    "#+TITLE: ${title}\n#+AUTHOR: xfwahss\n#+DATE: %<%Y-%m-%d>\n#+FILETAGS: :articlereading: \n\n* 概要\n\n* 亮点\n\n* 想法\n\n* 不足\n\n* 结论\n\n"
			    )
	 :unnarrowed t)
	
	("e" "english notes" plain "%?"
	 :target (file+head "english/english%<%Y%m%d%H>-${slug}.org"
			    "#+TITLE: ${title}\n#+AUTHOR: xfwahss\n#+DATE: %<%Y-%m-%d>\n#+FILETAGS: :english: \n\n")
	 :unnarrowed t)
	
	("p" "technique" plain "%?"
	 :target (file+head "technique/technique%<%Y%m%d%H>-${slug}.org"
			    "#+TITLE: ${title}\n#+AUTHOR: xfwahss\n#+DATE: %<%Y-%m-%d>\n#+FILETAGS: :technique: \n\n")
	 :unnarrowed t)
	
	("g" "agenda" plain "%?"
	 :target (file+head "agenda/agenda%<%Y%m%d%H>-${slug}.org"
			    "#+TITLE: ${title}\n#+AUTHOR: xfwahss\n#+DATE: %<%Y-%m-%d>\n#+FILETAGS: :agenda: \n\n")
	 :unnarrowed t)
	
	("c" "concept" plain "%?"
	 :target (file+head "concept/concept%<%Y%m%d%H>-${slug}.org"
			    "#+TITLE: ${title}\n#+AUTHOR: xfwahss\n#+DATE: %<%Y-%m-%d>\n#+FILETAGS: :concept: \n\n")
	 :unnarrowed t)
	("s" "summary" plain "%?"
	 :target (file+head "summary/summary%<%Y%m%d%H>-${slug}.org"
			    "#+TITLE: ${title}\n#+AUTHOR: xfwahss\n#+DATE: %<%Y-%m-%d>\n#+FILETAGS: :summary: \n\n")
	 :unnarrowed t)
	("t" "tool" plain "%?"
	 :target (file+head "tool/tool%<%Y%m%d%H>-${slug}.org"
			    "#+TITLE: ${title}\n#+AUTHOR: xfwahss\n#+DATE: %<%Y-%m-%d>\n#+FILETAGS: :tool: \n\n")
	 :unnarrowed t)
	))

(provide 'init-org)
;;; init-org.el ends here.
