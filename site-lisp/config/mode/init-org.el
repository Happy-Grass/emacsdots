(require 'org)
(require 'org-roam)
(require 'org-modern)
(require 'org-transclusion) ;嵌入式文档
(require 'org-super-agenda) ; 漂亮的agenda视图
(require 'org-roam-ui)
(require 'org-timeline)
(require 'org-fancy-priorities)
(require 'org-noter)
(require 'org-ref)


;; 让中文也可以不加空格就使用行内格式
(setcar (nthcdr 0 org-emphasis-regexp-components) " \t('\"{[:nonascii:]")
(setcar (nthcdr 1 org-emphasis-regexp-components) "- \t.,:!?;'\")}\\[[:nonascii:]")
(org-set-emph-re 'org-emphasis-regexp-components org-emphasis-regexp-components)
(org-element-update-syntax)
;; 规定上下标必须加 {}，否则中文使用下划线时它会以为是两个连着的下标
(setq org-use-sub-superscripts "{}")
;;自定义强调格式

;;UI, org-modern
;; Activate org-modern-mode for per buffer
(add-hook 'org-mode-hook #'org-modern-mode)
(add-hook 'org-agenda-finalize-hook #'org-modern-agenda)
;; auto wrap in org-mode
(add-hook 'org-mode-hook (lambda ()
			   (setq truncate-lines nil)))
(add-hook 'org-mode-hook (lambda ()
			   (progn (set-face-attribute 'org-level-1 nil :height 1.4 :bold t)
				 (set-face-attribute 'org-level-2 nil :height 1.2 :bold t)
				 (set-face-attribute 'org-level-3 nil :height 1.1 :bold t))))
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
      org-ellipsis "  ⏷"
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
(org-roam-db-autosync-mode)

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
(add-hook 'org-agenda-finalize-hook 'org-timeline-insert-timeline :append)

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

(major-mode-hydra-define org-mode
 (:title (pretty-hydra-title "Org Commands" 'sucicon "nf-custom-orgmode") :color amaranth :quit-key ("q" "C-g"))
 ("Agenda"
  (("t" org-todo "org-todo" :exit t)
   ("s" org-schedule "schedule" :exit t)
   ("d" org-deadline "deadline" :exit t)
   ("p" org-pomodoro "pomodoro" :exit t))
  "Attachment"
  (("a" org-attach "attach" :exit t)
   )
  "Outline"
  (("o" org-cycle "cycle" :exit t)
   ("O" org-global-cycle "cycle-global" :exit t)
   ("w" org-show-all "show-all" :exit t)
   )
 ))

(pretty-hydra-define org-roam-hydra
  (:title (pretty-hydra-title "Org Roam Commands" 'mdicon "nf-md-broadcast" )
    :color blue :quit-key ("q" "C-g"))
   ("Node"
    (("c" org-roam-capture "node-capture" :exit t)
     ("f" org-roam-node-find "node-find" :exit t)
     ("i" org-roam-node-insert "node-insert" :exit t)
     ("u" org-roam-ui-mode "node-ui" :exit t))
    "Edit"
    (("m" org-roam-ref-remove "ref-remove" :exit t)
     ("e" org-roam-ref-add "ref-add" :exit t)
     ("t" org-roam-tag-add "tag-add" :exit t)
     ("a" org-roam-tag-remove "tag-remove" :exit t)
     ("s" org-roam-alias-add "alias-add" :exit t)
     ("h" org-roam-alias-remove "alias-remove" :exit t))
    "Bibnotes"
    (("I" orb-insert-link "insert-article-ref" :exit t)
     ("F" org-roam-ref-find "find-article-node" :exit t)
     ("r" org-roam-bibtex-mode "refresh" :exit t)
     ("p" orb-note-actions "note-action" :exit t))
    ))

(defun hot-expand (str &optional mod)
  "Expand org template.

STR is a structure template string recognised by org like <s. MOD is a
string with additional parameters to add the begin line of the
structure element. HEADER string includes more parameters that are
prepended to the element after the #+HEADER: tag."
  (let (text)
    (when (region-active-p)
      (setq text (buffer-substring (region-beginning) (region-end)))
      (delete-region (region-beginning) (region-end)))
    (insert str)
    (if (fboundp 'org-try-structure-completion)
        (org-try-structure-completion) ; < org 9
      (progn
        ;; New template expansion since org 9
        (require 'org-tempo nil t)
        (org-tempo-complete-tag)))
    (when mod (insert mod) (forward-line))
    (when text (insert text))))


(pretty-hydra-define org-template-hydra
 (:title (pretty-hydra-title "Org Template" 'sucicon "nf-custom-orgmode" :face 'nerd-icons-green)
    :color blue :quit-key ("q" "C-g"))
   ("Basic"
    (("a" (hot-expand "<a") "ascii")
     ("c" (hot-expand "<c") "center")
     ("C" (hot-expand "<C") "comment")
     ("e" (hot-expand "<e") "example")
     ("E" (hot-expand "<E") "export")
     ("h" (hot-expand "<h") "html")
     ("l" (hot-expand "<l") "latex")
     ("n" (hot-expand "<n") "note")
     ("o" (hot-expand "<q") "quote")
     ("v" (hot-expand "<v") "verse"))
    "Head"
    (("i" (hot-expand "<i") "index")
     ("A" (hot-expand "<A") "ASCII")
     ("I" (hot-expand "<I") "INCLUDE")
     ("H" (hot-expand "<H") "HTML")
     ("L" (hot-expand "<L") "LaTeX"))
    "Source"
    (("s" (hot-expand "<s") "src")
     ("m" (hot-expand "<s" "emacs-lisp") "emacs-lisp")
     ("y" (hot-expand "<s" "python :results value") "python")
     ("p" (hot-expand "<s" "perl") "perl")
     ("w" (hot-expand "<s" "powershell") "powershell")
     ("r" (hot-expand "<s" "ruby") "ruby")
     ("S" (hot-expand "<s" "sh") "sh")
     ("g" (hot-expand "<s" "go :imports '\(\"fmt\"\)") "golang"))
    "Misc"
    (("u" (hot-expand "<s" "plantuml :file CHANGE.png") "plantuml")
     ("Y" (hot-expand "<s" "ipython :session :exports both :results raw drawer\n$0") "ipython")
     ("P" (progn
            (insert "#+HEADERS: :results output :exports both :shebang \"#!/usr/bin/env perl\"\n")
            (hot-expand "<s" "perl")) "Perl tangled")
     ("<" self-insert-command "ins"))))

(define-key org-mode-map (kbd "<")
	    (lambda ()
	      "Insert org template."
	      (interactive)
	      (if (or (region-active-p) (looking-back "^\s*" 1))
		  (org-template-hydra/body)
		(self-insert-command 1))))
(org-babel-do-load-languages 'org-babel-load-languages
			     '((python . t)))
(setq org-babel-python-command "D:/Conda/envs/emacs/python.exe")
;; Org-noter 配置
(setq org-noter-notes-search-path (list (concat xfw-org-roam-home "/article/")))
(setq org-noter-default-notes-file-names '("Summary.org"))
(setq org-noter-always-create-frame nil)
(setq org-noter-highlight-selected-text t);noter文本高亮 
(setq org-noter-max-short-selected-text-length 20) ;; 默认为80,修改长短文标准
(setq org-noter-default-heading-title "第 $p$ 页的笔记") ; 修改短文默认的标题
(require 'init-org-export)
;; Org-ref
(setq bibtex-completion-bibliography (list (concat xfw-notes-home "/ebib/bib/default.bib"))
      bibtex-completion-library-path (list (concat xfw-notes-home "/ebib/pdf/"))
      bibtex-completion-notes-path (concat xfw-org-roam-home "/article/")
      bibtex-completion-notes-template-multiple-files "* ${author-or-editor}, ${title}, ${journal}, (${year}) :${=type=}: \n\nSee [[cite:&${=key=}]]\n"
      bibtex-completion-additional-search-fields '(kewwords)
      bibtex-completion-display-formats
	'((article       . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${journal:40}")
	  (inbook        . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} Chapter ${chapter:32}")
	  (incollection  . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
	  (inproceedings . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
	  (t             . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*}"))
      bibtex-completion-pdf-open-function
      (lambda (fpath)
	(call-process "open" nil 0 nil fpath)))
(provide 'init-org)
;;; init-org.el ends here.
