(require 'vertico)
(require 'orderless)
(require 'vertico-posframe)
(vertico-mode)
(setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion))))
(vertico-posframe-mode 1)
(provide 'init-vertico)
