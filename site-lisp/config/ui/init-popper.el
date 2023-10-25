(require 'popper)
(setq popper-reference-buffers
      '("\\*Messages\\*"
        "Output\\*$"
        "\\*Compile-Log\\*"
        "\\*Completions\\*"
        "\\*Warnings\\*"
        "\\*Async Shell Command\\*"
	"\\*lsp-bridge\\*"
        "\\*Kill Ring\\*"
        help-mode
	helpful-mode
        Buffer-menu-mode
	"magit:*" magit-mode
        "^\\*eshell.*\\*.*$"       eshell-mode
        "^\\*shell.*\\*.*$"        shell-mode
        "^\\*terminal.*\\*.*$"     term-mode
        "^\\*vterm[inal]*.*\\*.*$" vterm-mode
        ))

(popper-mode +1)

(setq popper-mode-line "P")
(setq popper-echo-dispatch-keys '("C-1" "C-2" "C-3" "C-4" "C-5"))
(setq popper-echo-lines 1)
(setq ppoper-echo-transform-function nil)
;; For echo-area hints
(require 'popper-echo)
(popper-echo-mode +1)
(provide 'init-popper)
