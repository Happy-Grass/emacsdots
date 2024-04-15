(require 'centaur-tabs)
(global-set-key (kbd "C-;")  'centaur-tabs-backward)
(global-set-key (kbd "C-'") 'centaur-tabs-forward)
;; 展开关闭分组
(global-set-key (kbd "C-:") 'centaur-tabs-toggle-groups)
(global-set-key (kbd "C-\"") 'centaur-tabs-toggle-groups)

(setq centaur-tabs-style "bar"
        centaur-tabs-height 32
        centaur-tabs-set-icons t
        centaur-tabs-show-new-tab-button t
        centaur-tabs-set-modified-marker t
        centaur-tabs-show-navigation-buttons t
        centaur-tabs-set-bar 'under
        centaur-tabs-show-count nil
        centaur-tabs-modified-marker "*"
        ;;centaur-tabs-label-fixed-length 5
        ;; centaur-tabs-gray-out-icons 'buffer
        ;; centaur-tabs-plain-icons t
        x-underline-at-descent-line t
        centaur-tabs-left-edge-margin nil)
(centaur-tabs-headline-match)
(defun centaur-tabs-buffer-groups ()
  "`centaur-tabs-buffer-groups' control buffers' group rules.

Group centaur-tabs with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
All buffer name start with * will group to \"Emacs\".
Other buffer group by `centaur-tabs-get-group-name' with project name."
  (list
   (cond
    ((memq major-mode '(chatgpt-shell-mode shell-mode eshell-mode))
     "Shell")
    ((or (string-equal "*" (substring (buffer-name) 0 1))
         (memq major-mode '(magit-process-mode
                            magit-status-mode
                            magit-diff-mode
                            magit-log-mode
                            magit-file-mode
                            magit-blob-mode
                            magit-blame-mode
                            )))
     "Emacs")
    ((memq major-mode '(latex-mode tex-mode LaTeX-mode))
     "LaTex")
    ((derived-mode-p 'emacs-lisp-mode)
     "Config")
    ((derived-mode-p 'prog-mode)
     "Editing")

    ((or (string-equal "Notes" (substring (buffer-name) 0 5))
	 (string-equal "*Edit" (substring (buffer-name) 0 5))
	 (derived-mode-p 'pdf-view-mode))
     "Reading")

    ((derived-mode-p 'dired-mode)
     "Dired")
    ((memq major-mode '(helpful-mode
                        help-mode))
     "Help")
    ((memq major-mode '(org-mode
                        org-agenda-clockreport-mode
                        org-src-mode
                        org-agenda-mode
                        org-beamer-mode
                        org-indent-mode
                        org-bullets-mode
                        org-cdlatex-mode
                        org-agenda-log-mode
                        diary-mode))
     "Orgmode")
    (t
     (centaur-tabs-get-group-name (current-buffer))))))
(setq centaur-tabs--buffer-show-groups t)
(setq centaur-tabs-cycle-scope 'tabs)
(defun centaur-tabs-hide-tab (x)
  "Do no to show buffer X in tabs."
  (let ((name (format "%s" x)))
    (or
     ;; Current window is not dedicated window.
     (window-dedicated-p (selected-window))

     ;; Buffer name not match below blacklist.
     (string-prefix-p "*epc" name)
     (string-prefix-p "*Compile-Log*" name)
     (string-prefix-p "*lsp" name)
     (string-prefix-p "*company" name)
     (string-prefix-p "*Flycheck" name)
     (string-prefix-p "*tramp" name)
     (string-prefix-p " *Mini" name)
     (string-prefix-p "*help" name)
     (string-prefix-p "*straight" name)
     (string-prefix-p " *temp" name)
     (string-prefix-p "*Help" name)
     (string-prefix-p "*mybuf" name)

     ;; Is not magit buffer.
     (and (string-prefix-p "magit" name)
          (not (file-name-extension name)))
     )))
(centaur-tabs-mode t)
(provide 'init-tab)
