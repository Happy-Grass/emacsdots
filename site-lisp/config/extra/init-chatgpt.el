(require 'chatgpt-shell)
(require 'dall-e-shell)
(require 'ob-chatgpt-shell)

;; Add cat to PATH
(setenv "PATH" (concat "D:/MSYS64/usr/bin;" (getenv "PATH")));; For cat
(setenv "PATH" (concat "D:/MSYS64/mingw64/bin;" (getenv "PATH")));; For curl
(setq exec-path (split-string (getenv "PATH") ";"))

;; Read api-key from  txt file
(defun read-api-key-from-file (file)
  (with-temp-buffer
    (insert-file-contents file)
    (re-search-forward "api-key:\\(.*\\)$" nil t)
    (match-string 1)))

;;(setq chatgpt-shell-api-url-base "https://kapkey.chatgptapi.org.cn")
(setq chatgpt-shell-openai-key (read-api-key-from-file "~/.emacs.d/chatgpt-apikey.txt"))
(setq chatgpt-shell-model-version 8);; use chatgpt 3.5 as default 


(pretty-hydra-define chatgpt-hydra
 (:title (pretty-hydra-title "ChatGpt Commands" 'faicon "nf-fa-snapchat") :quit-key "q")
  ("Shell"
   (("s" chatgpt-shell "start shell" :exit t)
    ("c" chatgpt-shell-swap-model-version "change model" :exit t))
   "Output"
   (("p" chatgpt-shell-previous-item "previous item")
    ("t" chatgpt-shell-interrupt "interrupt" :exit t)
    ("n" chatgpt-shell-next-item "next item"))
   "Edit"
   (("r" chatgpt-shell-refactor-code "refactor code" :exit t)
    ("d" chatgpt-shell-describe-code "describe code" :exit t)
    ("i" chatgpt-shell-describe-image "describe image" :exit t)
    )
   ))
(provide 'init-chatgpt)
