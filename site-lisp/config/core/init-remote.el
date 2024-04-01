(setq tramp-default-method "plinkx")
(setq tramp-default-user "root")
(setq tramp-auto-save-directory "~/tmp/tramp/")
(setq tramp-chunksize 2000)

;;(setq tramp-verbose 10);; Debug 时才开启
;; 远程连接配置 没有必要用,和tramp一样的
(setq server-use-tcp t
      server-port 9999)
(setq server-socket-dir "~/.emacs.d/server")
(require 'server)

;; 必须保证远程的~/.emacs.d/server/文件夹存在
(defun server-start-and-copy ()
  "start server and copy auth files"
  (interactive)
  (when (and (fboundp 'server-running-p)   ; function exists.
             (not (server-running-p)))
    (server-start)                       ; emacs as server mode
    (when (file-exists-p "/plinkx:local_xfw:~/.emacs.d/server/server")
      (delete-file "/plinkx:local_xfw:~/.emacs.d/server/server"))
    (copy-file "~/.emacs.d/server/server" "/plinkx:local_xfw:~/.emacs.d/server/server")
    ))

(provide 'init-remote)
