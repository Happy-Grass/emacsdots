(require 'popper)
(setq popper-reference-buffers
      '("\\*Messages\\*"
        "Output\\*$" "\\*Pp Eval Output\\*$"
        "\\*Compile-Log\\*"
        "\\*Completions\\*"
        "\\*Warnings\\*"
        "\\*Async Shell Command\\*"
        "\\*Apropos\\*"
        "\\*Backtrace\\*"
        "\\*Calendar\\*"
        "\\*Embark Actions\\*"
        "\\*Finder\\*"
        "\\*Kill Ring\\*"
        "\\*Go-Translate\\*"
	
        bookmark-bmenu-mode
        comint-mode
        compilation-mode
        help-mode helpful-mode
        tabulated-list-mode
        Buffer-menu-mode
	
        flymake-diagnostics-buffer-mode
        flycheck-error-list-mode flycheck-verify-mode
	
        gnus-article-mode devdocs-mode
        grep-mode occur-mode rg-mode deadgrep-mode ag-mode pt-mode
        ivy-occur-mode ivy-occur-grep-mode
        youdao-dictionary-mode osx-dictionary-mode fanyi-mode
	
        "^\\*Process List\\*" process-menu-mode
        list-environment-mode cargo-process-mode
	
        "^\\*eshell.*\\*.*$"       eshell-mode
        "^\\*shell.*\\*.*$"        shell-mode
        "^\\*terminal.*\\*.*$"     term-mode
        "^\\*vterm[inal]*.*\\*.*$" vterm-mode
	
        "\\*DAP Templates\\*$" dap-server-log-mode
        "\\*ELP Profiling Restuls\\*" profiler-report-mode
        "\\*Paradox Report\\*$" "\\*package update results\\*$" "\\*Package-Lint\\*$"
        "\\*[Wo]*Man.*\\*$"
        "\\*ert\\*$" overseer-buffer-mode
        "\\*gud-debug\\*$"
        "\\*lsp-help\\*$" "\\*lsp session\\*$"
        "\\*quickrun\\*$"
        "\\*tldr\\*$"
        "\\*vc-.*\\*$"
        "^\\*macro expansion\\**"

        "\\*Agenda Commands\\*" "\\*Org Select\\*" "\\*Capture\\*" "^CAPTURE-.*\\.org*"
        "\\*Gofmt Errors\\*$" "\\*Go Test\\*$" godoc-mode
        "\\*docker-.+\\*"
        "\\*prolog\\*" inferior-python-mode inf-ruby-mode swift-repl-mode
        "\\*rustfmt\\*$" rustic-compilation-mode rustic-cargo-clippy-mode
        rustic-cargo-outdated-mode rustic-cargo-run-mode rustic-cargo-test-mode))

(global-set-key (kbd "C-1") 'popper-toggle-latest)  
(global-set-key (kbd "M-`") 'popper-cycle)
(global-set-key (kbd "C-M-`") 'popper-toggle-type)
(popper-mode +1)

;; For echo-area hints
(require 'popper-echo)
(popper-echo-mode +1)
(provide 'init-popper)