(defgroup xfw nil
  "xfw Emacs customization."
  :group 'convenience
  :link '(url-link :tag "Homepage" "https://github.com/Happy-Grass/.emacs.d"))

(defcustom xfw-proxy "127.0.0.1:10809"
  "Set HTTP/HTTPS proxy."
  :group 'xfw
  :type 'string)

(defcustom xfw-socks-proxy "127.0.0.1:10808"
  "Set SOCKS proxy."
  :group 'xfw
  :type 'string)


;; Org-roam
(defcustom xfw-org-roam-home "F:/BaiduSyncdisk/Notes/roam"
  "Set Org-roam home"
  :group 'xfw
  :type 'string)


(defcustom xfw-notes-home "F:/BaiduSyncdisk/Notes"
  "Set Org-roam home"
  :group 'xfw
  :type 'string)

(provide 'init-setting)
