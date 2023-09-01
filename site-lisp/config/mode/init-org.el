(require 'org)
(require 'org-roam)
(require 'org-modern)
(require 'org-transclusion) ;嵌入式文档
(require 'org-super-agenda) ; 漂亮的agenda视图
(require 'org-roam-ui)
(require 'org-timeline)
(require 'org-fancy-priorities)

;;UI, org-modern
;; Activate org-modern-mode for per buffer
(add-hook 'org-mode-hook #'org-modern-mode)
(add-hook 'org-agenda-finalize-hook #'org-modern-agenda)

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
;; Super agenda
(setq org-super-agenda-groups
       '(;; Each group has an implicit boolean OR operator between its selectors.
         (:name "Today"  ; Optionally specify section name
                :time-grid t  ; Items that appear on the time grid
                :todo "TODAY")  ; Items that have this TODO keyword
         (:name "Important"
                ;; Single arguments given alone
                :tag "bills"
                :priority "A")
         ;; Set order of multiple groups at once
         (:order-multi (2 (:name "Shopping in town"
                                 ;; Boolean AND group matches items that match all subgroups
                                 :and (:tag "shopping" :tag "@town"))
                          (:name "Food-related"
                                 ;; Multiple args given in list with implicit OR
                                 :tag ("food" "dinner"))
                          (:name "Personal"
                                 :habit t
                                 :tag "personal")
                          (:name "Space-related (non-moon-or-planet-related)"
                                 ;; Regexps match case-insensitively on the entire entry
                                 :and (:regexp ("space" "NASA")
                                               ;; Boolean NOT also has implicit OR between selectors
                                               :not (:regexp "moon" :tag "planet")))))
         ;; Groups supply their own section names when none are given
         (:todo "WAITING" :order 8)  ; Set order of this section
         (:todo ("SOMEDAY" "TO-READ" "CHECK" "TO-WATCH" "WATCHING")
                ;; Show this group at the end of the agenda (since it has the
                ;; highest number). If you specified this group last, items
                ;; with these todo keywords that e.g. have priority A would be
                ;; displayed in that group instead, because items are grouped
                ;; out in the order the groups are listed.
                :order 9)
         (:priority<= "B"
                      ;; Show this section after "Today" and "Important", because
                      ;; their order is unspecified, defaulting to 0. Sections
                      ;; are displayed lowest-number-first.
                      :order 1)
         ;; After the last group, the agenda will display items that didn't
         ;; match any of these groups, with the default order position of 99
         ))
 

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
;; Org-roam-ui
(setq org-roam-ui-sync-theme t
      org-roam-ui-follow t
      org-roam-ui-update-on-save t
      org-roam-ui-open-on-start t)

;; Org-timeline
(add-hook 'org-agenda-finalize-hook 'org-timline-insert-timeline :append)

;; Org-fancy-priorities
(setq org-fancy-priorities-list '((?A . "❗")
                                  (?B . "⬆")
                                  (?C . "⬇")
                                  (?D . "☕")
                                  (?1 . "⚡")
                                  (?2 . "⮬")
                                  (?3 . "⮮")
                                  (?4 . "☕")
                                  (?I . "Important")))
(add-hook 'org-mode 'org-fancy-priorities-mode)
(add-hook 'org-agenda-finalize-hook 'org-fancy-priorities-mode)
(provide 'init-org)
;;; init-org.el ends here.
