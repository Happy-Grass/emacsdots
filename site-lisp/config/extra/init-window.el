(require 'ace-window)
(require 'ace-window-posframe)
(require 'window-purpose)
(purpose-mode)
;; python layout
(add-to-list 'purpose-user-mode-purposes '(python-ts-mode . py))
(add-to-list 'purpose-user-mode-purposes '(python-mode . py))
(add-to-list 'purpose-user-mode-purposes '(inferior-python-mode . py-repl))


(add-to-list 'purpose-user-mode-purposes '(pdf-view-mode . pdf))
(add-to-list 'purpose-user-mode-purposes '(org-mode . note))
(purpose-compile-user-configuration)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(setq aw-dispatch-always nil) ;;两个窗口以下就不用输入字母直接交换
(setq aw-ignored-buffers '("*Calc Trail*" "*LV*"))

(pretty-hydra-define window-hydra
  (:title (pretty-hydra-title "Windows" 'mdicon "nf-md-microsoft_windows" )
    :color blue :quit-key ("q" "C-g"))
   ("Split"
    (("h" split-window-below "split window horizontal" :exit t)
     ("v" split-window-right "split window vertical" :exit t)
     ("b" switch-to-buffer-other-window "open buffer another window" :exit t)
     ("f" find-file-other-window "open file another window" :exit t))
    "Jump"
    (("o" ace-window "window jump" :exit t)
     ("D" ace-delete-other-windows "window delete others" :exit t)
     ("d" ace-delete-window "window delete" :exit t))
    ))

 ;;(("TAB" other-window "switch" :exit t)
     ;;("x" ace-delete-window "delete" :exit t)
     ;;("X" ace-delete-other-windows "delete other" :exit t)
     ;;("s" ace-swap-window "swap" :exit t)
     ;;("a" ace-select-window "select" :exit t)
     ;;("m" toggle-frame-maximized "maximize" :exit t)
     ;;("f" toggle-frame-fullscreen "fullscreen" :exit t))
    ;;"Resize"
    ;;(("h" shrink-window-horizontally "��")
     ;;("j" enlarge-window "��")
     ;;("k" shrink-window "��")
     ;;("l" enlarge-window-horizontally "��")
     ;;("n" balance-windows "balance" :exit t))
    ;;"Split"
    ;;(("r" split-window-right "horizontally" :exit t)
     ;;("R" split-window-horizontally-instead "horizontally instead" :exit t)
     ;;("v" split-window-below "vertically" :exit t)
     ;;("V" split-window-vertically-instead "vertically instead" :exit t)
     ;;("t" toggle-window-split "toggle" :exit t))
    ;;"Zoom"
    ;;(("+" text-scale-increase "in")
     ;;("=" text-scale-increase "in")
     ;;("-" text-scale-decrease "out")
     ;;("0" (text-scale-increase 0) "reset"))
    ;;"Appearance"
    ;;(("F" set-frame-font "font")
     ;;("T" xfw-load-theme "theme"))))
(provide 'init-window)
