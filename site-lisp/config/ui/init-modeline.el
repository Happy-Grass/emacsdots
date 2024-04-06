(require 'awesome-tray)
(setq awesome-tray-active-modules '("git" "location" "mode-name" "input-method"  "pdf-view-page" "belong" "file-path" "last-command" "battery" "date"))
(setq awesome-tray-info-padding-right 1) ;; Avoid warpping
(setq awesome-tray-mode-line-inactive-color "#0f0f14"
      awesome-tray-mode-line-active-color "#343b58"
      awesome-tray-date-format "%-H:%-M"
      awesome-tray-input-method-default-style "en"
      awesome-tray-input-method-local-style "zh"
      awesome-tray-input-method-local-methods '("pyim")
      awesome-tray-file-path-truncated-name-length 2
      )
(setq awesome-tray-git-show-status t)
(awesome-tray-mode 1)
;; 确保每次创建buffer的modeline显示正常
(add-hook 'buffer-list-update-hook 'awesome-tray-enable)
(provide 'init-modeline)
