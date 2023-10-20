(require 'major-mode-hydra)
(require 'hydra-posframe)
(require 'cl-lib)
(add-hook 'after-init-hook 'hydra-posframe-mode)
;;(defvar global-toggles--title (with-faicon "toggle-on" "Toggles" 1 -0.05))

;; 行号
;;;###autoload
(define-minor-mode line-number-mode
  "Toggle line number display mode in the menu bar."
  :init-value nil
  :global nil
  :lighter " Linum"
  (if line-number-mode
      (progn
        (menu-bar--display-line-numbers-mode-relative)
        (message "Line numbers: Relative"))
    (progn
      (menu-bar--display-line-numbers-mode-none)
      (message "Line numbers: None"))))
(add-hook 'prog-mode-hook 'line-number-mode)

(cl-defun pretty-hydra-title (title &optional icon-type icon-name
                                    &key face height v-adjust)
  "Add an icon in the hydra title."
  (let ((face (or face `(:foreground ,(face-background 'highlight))))
        (height (or height 1.2))
        (v-adjust (or v-adjust 0.0)))
    (concat
     (when (and icon-type icon-name)
       (let ((f (intern (format "nerd-icons-%s" icon-type))))
         (when (fboundp f)
           (concat
            (apply f (list icon-name :face face :height height :v-adjust v-adjust))
            " "))))
     (propertize title 'face face))))



(pretty-hydra-define global-toggles
  (:color amaranth :quit-key "q" :title (pretty-hydra-title "Toggles" 'faicon "nf-fa-toggle_on"))
  ("Basic"
   (("n" line-number-mode "line number" :toggle t)
    ("w" whitespace-mode "whitespace" :toggle t)
    ("W" whitespace-cleanup-mode "whitespace cleanup" :toggle t)
    ("r" rainbow-mode "rainbow" :toggle t)
    ("L" page-break-lines-mode "page break lines" :toggle t))
   "Highlight"
   (("s" symbol-overlay-mode "symbol" :toggle t)
    ("l" global-hl-line-mode "line" :toggle t)
    ("x" highlight-sexp-mode "sexp" :toggle t)
    ("t" hl-todo-mode "todo" :toggle t))
   "UI"
   (("d" jp-themes-toggle-light-dark "dark theme" :toggle jp-current-theme-dark-p))
   "Coding"
   (("p" smartparens-mode "smartparens" :toggle t)
    ("P" smartparens-strict-mode "smartparens strict" :toggle t)
    ("S" show-smartparens-mode "show smartparens" :toggle t)
    ("f" flycheck-mode "flycheck" :toggle t))
   "Emacs"
   (("D" toggle-debug-on-error "debug on error" :toggle (default-value 'debug-on-error))
    ("X" toggle-debug-on-quit "debug on quit" :toggle (default-value 'debug-on-quit)))))

(pretty-hydra-define popper-hydra
  (:title (pretty-hydra-title "Popper Commands" 'flicon "nf-linux-pop_os") :quit-key "q")
  ("Basic"
   (("o" popper-toggle "popper toggle" :exit t)
   ("c" popper-cycle "popper cycle")
   ("t" popper-toggle-type "popper toggle type" :exit t))
   ))
  

(global-set-key (kbd "C-c p") 'popper-hydra/body)  

(provide 'init-hydra)
