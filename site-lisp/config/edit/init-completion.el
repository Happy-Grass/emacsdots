(require 'corfu)
(corfu-mode)
(setq completion-cycle-threshold 3)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
(setq tab-always-indent 'complete)

  ;; Emacs 30 and newer: Disable Ispell completion function. As an alternative,
  ;; try `cape-dict'.
(setq text-mode-ispell-word-completion nil)

  ;; Emacs 28 and newer: Hide commands in M-x which do not apply to the current
  ;; mode.  Corfu commands are hidden, since they are not used via M-x. This
  ;; setting is useful beyond Corfu.
(setq read-extended-command-predicate #'command-completion-default-include-p)
;; Enable auto completion and configure quitting
(setq corfu-auto t
      corfu-quit-no-match 'separator) ;; or this
(setq-local corfu-auto        t
            corfu-auto-delay  0.5 ;; TOO SMALL - NOT RECOMMENDED
            corfu-auto-prefix 2 ;; TOO SMALL - NOT RECOMMENDED
            completion-styles '(basic))

(add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter)

;; Optionally:
(setq nerd-icons-corfu-mapping
      '((array :style "cod" :icon "symbol_array" :face font-lock-type-face)
        (boolean :style "cod" :icon "symbol_boolean" :face font-lock-builtin-face)
        ;; ...
        (t :style "cod" :icon "code" :face font-lock-warning-face)))
        ;; Remember to add an entry for `t', the library uses that as default.

;; The Custom interface is also supported for tuning the variable above.
