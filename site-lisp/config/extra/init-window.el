(require 'ace-window)
(require 'ace-window-posframe)
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
(provide 'init-window)
