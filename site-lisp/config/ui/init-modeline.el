(require 'awesome-tray)
(setq awesome-tray-activate-modules '("location" "pdf-view-page" "belong" "file-path" "mode-name" "last-command" "battery" "date"))
(setq awesome-tray-date-format "%m-%d %-H:%-M")
(setq awesome-tray-info-padding-right 1) ;; Avoid warpping
(setq awesome-tray-git-show-status t)
(setq awesome-tray-hide-mode-line t)
(awesome-tray-mode 1)
(provide 'init-modeline)
