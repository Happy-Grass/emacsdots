(require 'popper)
(require 'popper-echo)
(require 'shackle)
(setq popper-reference-buffers
      '("\\*Messages\\*"
        "^\\*.*\\*$"
        "Output\\*$"
        "\\*Compile-Log\\*"
        "\\*Completions\\*"
        "\\*Warnings\\*"
        "\\*Async Shell Command\\*"
	"\\*lsp-bridge\\*"
        "\\*Kill Ring\\*"
	"\\*Backtrace\\*"
        help-mode
	helpful-mode
	tex-shell-mode
        Buffer-menu-mode
	"magit:*" magit-mode
        "^\\*eshell.*\\*.*$"       eshell-mode
        "^\\*shell.*\\*.*$"        shell-mode
        "^\\*terminal.*\\*.*$"     term-mode
        "^\\*vterm[inal]*.*\\*.*$" vterm-mode
        "^\\*Edit*"      
	chatgpt-shell-mode
        ))

;; 非popper控制的buffer吧
(setq shackle-default-size 0.3
      shackle-default-alignment 'below)
;; :ignore t 不显示buffer
(setq shackle-rules
      '((eshell-mode :align right :size 0.4 :popup t :select t :other t)
        (shell-mode :align right :size 0.4 :popup t :select t)
        ("*shell*" :align right :size 0.4 :popup t :select t)
        (help-mode :align below :size 0.3 :popup t)
        (helpful-mode :align below :size 0.3 :popup t)
        ("*eshell*" :align right :size 0.4 :popup t :select t :other t)))

;; HACK: close popper window with `C-g'
(defun +popper-close-window-hack (&rest _)
  "Close popper window via `C-g'."
  (when (and (called-interactively-p 'interactive)
             (not (region-active-p))
             popper-open-popup-alist)
    (let ((window (caar popper-open-popup-alist)))
      (when (window-live-p window)
        (delete-window window)))))
(advice-add #'keyboard-quit :before #'+popper-close-window-hack)

;;(setq popper-display-control nil);;use shackle for placement
(setq popper-window-height 20)
(setq popper-mode-line "P")
(setq popper-echo-dispatch-keys '("C-1" "C-2" "C-3" "C-4" "C-5"))
(setq popper-echo-lines 1)
(setq ppoper-echo-transform-function nil)
;; For echo-area hints


(pretty-hydra-define popper-hydra
  (:title (pretty-hydra-title "Popper Commands" 'flicon "nf-linux-pop_os") :quit-key ("q" "C-g"))
  ("Basic"
   (("o" popper-toggle "popper toggle" :exit t)
   ("c" popper-cycle "popper cycle" )
   ("t" popper-toggle-type "popper toggle type" :exit t))
   ))

;;(shackle-mode 1)
(popper-mode +1)
(winner-mode +1)
(popper-echo-mode +1)
(provide 'init-popper)
