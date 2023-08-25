(let (
      ;; 加载的时候临时增大`gc-cons-threshold'以加速启动速度。
      (gc-cons-threshold most-positive-fixnum)
      (gc-cons-percentage 0.6)
      ;; 清空避免加载远程文件的时候分析文件。
      (file-name-handler-alist nil))
  (setq
   ;; 不要自动启用package
   package-enable-at-startup nil
   package--init-file-ensured t)
  ;; 让窗口启动更平滑
  (setq frame-inhibit-implied-resize t)
  (setq-default inhibit-redisplay t
                inhibit-message t)
  (add-hook 'window-setup-hook
            (lambda ()
              (setq-default inhibit-redisplay nil
                            inhibit-message nil)
              (redisplay)))
  (require 'init-font)
  (require 'init-generic)
  (require 'lazycat-theme)
  ;; (lazycat-theme-load-with-sunrise)
  (lazycat-theme-load-dark)
  ;; (lazycat-theme-load-light)
  (require 'lazy-load)
  (require 'evil)
  (evil-mode 1)
  )
  (provide 'init)
;;; init.el ends here.
