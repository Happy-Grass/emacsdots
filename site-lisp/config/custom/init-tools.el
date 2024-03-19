(require 'init-setting)
(require 'init-org)
(require 'org-download)
(require 'google-translate)
(require 'google-translate-smooth-ui)
;; Network Proxy
(defun proxy-http-show ()
  "Show HTTP/HTTPS proxy."
  (interactive)
  (if url-proxy-services
      (message "Current HTTP proxy is `%s'" xfw-proxy)
    (message "No HTTP proxy")))

(defun proxy-http-enable ()
  "Enable HTTP/HTTPS proxy."
  (interactive)
  (setq url-proxy-services
        `(("http" . ,xfw-proxy)
          ("https" . ,xfw-proxy)
          ("no_proxy" . "^\\(localhost\\|192.168.*\\|10.*\\)")))
  (proxy-http-show))

(defun proxy-http-disable ()
  "Disable HTTP/HTTPS proxy."
  (interactive)
  (setq url-proxy-services nil)
  (proxy-http-show))

(defun proxy-http-toggle ()
  "Toggle HTTP/HTTPS proxy."
  (interactive)
  (if (bound-and-true-p url-proxy-services)
      (proxy-http-disable)
    (proxy-http-enable)))

(defun proxy-socks-show ()
  "Show SOCKS proxy."
  (interactive)
  (if (bound-and-true-p socks-noproxy)
      (message "Current SOCKS%d proxy is %s:%s"
               (cadddr socks-server) (cadr socks-server) (caddr socks-server))
    (message "No SOCKS proxy")))

(defun proxy-socks-enable ()
  "Enable SOCKS proxy."
  (interactive)
  (require 'socks)
  (setq url-gateway-method 'socks
        socks-noproxy '("localhost"))
  (let* ((proxy (split-string xfw-socks-proxy ":"))
         (host (car proxy))
         (port (string-to-number (cadr proxy))))
    (setq socks-server `("Default server" ,host ,port 5)))
  (setenv "all_proxy" (concat "socks5://" xfw-socks-proxy))
  (proxy-socks-show))

(defun proxy-socks-disable ()
  "Disable SOCKS proxy."
  (interactive)
  (setq url-gateway-method 'native
        socks-noproxy nil
        socks-server nil)
  (setenv "all_proxy" "")
  (proxy-socks-show))

(defun proxy-socks-toggle ()
  "Toggle SOCKS proxy."
  (interactive)
  (if (bound-and-true-p socks-noproxy)
      (proxy-socks-disable)
    (proxy-socks-enable)))

;;自定义工具系列
(setq org-download-screenshot-method "i_view64 /capture=4 /convert=\"%s\"")
(setq org-download-display-inline-images 'posframe)
(setq-default org-download-heading-lvl nil)
(setq-default org-download-image-dir (concat xfw-org-roam-home "/figures"))
;; Drag-and-drop to `dired`
(add-hook 'dired-mode-hook 'org-download-enable)
;; Show images in posframe

(defun org-showlink-image ()  
  "使用posframe显示图片"  
  (interactive)  
  (let* ((link (org-element-context))  
         (path (and (org-element-type link)  
                    (org-element-property :path link)))  
         (image-file (and path (expand-file-name path)))  
         (image-buffer (get-buffer-create "*Image Viewer")))  

    (with-current-buffer image-buffer
      (erase-buffer)
      (insert-image-file image-file))
    (posframe-show image-buffer
		   :position (point)
		   :mim-width 40
		   :min-height 10
		   :internal-border-width 1
		   :poshandler 'posframe-poshandler-window-top-right-corner
		   :internal-border-color "red")))
(defun delete-showed-image ()
  "posframe不会自动删除,使用这个手动删除"
  (interactive)
  (posframe-delete "*Image Viewer"))

(defun org-download-screenshot-outside ()
  "最小化然后截图"
  (interactive)
  (lower-frame) ;; 把emacs最小化
  (org-download-screenshot))

(setq google-translate-default-source-language "en")
(setq google-translate-default-target-language "zh-CN")
(setq google-translate-translation-directions-alist
      '(("en" . "zh-CN") ("zh-CN" . "en")))

(pretty-hydra-define tools-hydra
  (:title (pretty-hydra-title "Tools" 'mdicon "nf-md-tools" )
    :color blue :quit-key ("q" "C-g"))
   ("Proxy"
    (("s" proxy-socks-show "show socks proxy" :exit t)
     ("e" proxy-socks-enable "enable socks proxy" :exit t)
     ("k" proxy-socks-disable "disable socks proxy" :exit t))
    "Images"
    (("C" org-download-screenshot "screentshot-emacs" :exit t)
     ("c" org-download-screenshot-outside "screentshot-outside" :exit t)
     ("o" org-showlink-image "show image" :exit t)
     ("O" delete-showed-image "hide image" :exit t)
     ("p" org-download-clipboard "copy image" :exit t)
     ("h" org-download-edit "edit image" :exit t)
     ("d" org-download-delete "delete image" :exit t)
     ("r" org-download-rename-at-point "rename image at point" :exit t)
     ("R" org-download-rename-last-file "rename last file" :exit t))
    "Translate"
    (("t" google-translate-smooth-translate "translate" :exit t)
     ("T" google-translate-buffer "translate buffer" :exit t)
     ("n" google-translate-at-point "translate at point(PDF)" :exit t)
     )
    ))

(provide 'init-tools)
;;; init-tools.el ends here.

