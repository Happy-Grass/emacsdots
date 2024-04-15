(setq
 ;; 不要自动启用package
 package-enable-at-startup nil
 package--init-file-ensured t)
(let (
      ;; 加载的时候临时增大`gc-cons-threshold'以加速启动速度。
      (gc-cons-thresold most-positive-fixnum)
      (gc-cons-percentage 0.6)
      ;; 清空避免加载远程文件的时候分析文件。
      (file-name-handler-alist nil))
  ;; 让窗口启动更平滑
  (setq frame-inhibit-implied-resize t)
  (setq-default inhibit-redisplay t
                inhibit-message t)
  (add-hook 'window-setup-hook
            (lambda ()
              (setq-default inhibit-redisplay nil
                            inhibit-message nil)
              (redisplay)))

  (with-temp-message ""
    ;; 摸掉插件的启动输出
  ;; 统计插件启动时间
  (require 'benchmark-init)
  (require 'benchmark-init-modes)
  (benchmark-init/activate)

  (require 'init-font)
  (require 'init-generic)
  (require 'init-remote)
  (require 'init-vertico)

  

  (require 'doom-themes)
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-moonlight t)
  (require 'init-diff-hl)
  (require 'init-modeline)
  (require 'init-tab)
  (require 'init-fringe)
  (require 'init-dired)
  (setq custom-file "~/.emacs.d/.emacs-custom.el")
  (load custom-file)

  (require 'init-evil)
  (require 'init-hydra);; must load before init-lazyload
  (require 'init-popper)
  (require 'init-lazyload)
  (require 'init-setting)
  (require 'init-treesit)
  (require 'init-env)
  (require 'init-ace)
  (require 'init-color)
  ;(require 'init-eaf)
  ;(require 'init-tools)
  ;(require 'init-color)
  ;(require 'init-lsp-bridge)
  ;; 空闲时间自动加载的
  (run-with-idle-timer
   10 nil
   #'(lambda ()
       (require 'init-pyim)
       (require 'init-org)
       )))
  )
  (benchmark-init/activate)
  (provide 'init)
;;; init.el ends here.
