(defun font-installed-p (font-name)
  "Check if font with FONT-NAME is available."
  (find-font (font-spec :name font-name)))

(defun create-variable-pitch-fontset (name ascii-font han-font)
  "Create fontset named NAME with given ASCII-FONT and HAN-FONT."
  (let ((registry (concat "fontset-variable pitch " name)))
    (create-fontset-from-fontset-spec
     (font-xlfd-name
      (font-spec :family ascii-font
                 :registry registry)))
    (set-fontset-font registry 'han
                      (font-spec :family han-font))
    (set-fontset-font registry '(#x4e00 . #x9fff)
		    (font-spec :family han-font))
    (set-fontset-font registry 'cjk-misc
                      (font-spec :family han-font))))
;; 创建字符集
(create-variable-pitch-fontset "orgtable"
                               "Monaco"
                               "Sarasa Term SC Nerd")
(defun xfw-setup-fonts ()
  "Setup fonts."
  (when (display-graphic-p)
    ;; Set default font
    (cl-loop for font in '("Monaspace Neon" "Victor mono"  "Source Code Pro" "Cascadia Code" "Fira Code" "Jetbrains Mono"
                           "SF Mono" "Hack"  "Menlo"
                           "Monaco" "DejaVu Sans Mono" "Consolas")
             when (font-installed-p font)
             return (set-face-attribute 'default nil
                                        :family font
                                        :height 100))

    ;; Set mode-line font
     ;;(cl-loop for font in '("Menlo" "SF Pro Display" "Helvetica")
              ;;when (font-installed-p font)
              ;;return (progn
                       ;;(set-face-attribute 'mode-line nil :family font :height 120)
                       ;;(when (facep 'mode-line-active)
                         ;;(set-face-attribute 'mode-line-active nil :family font :height 120))
                       ;;(set-face-attribute 'mode-line-inactive nil :family font :height 120)))

    ;; Specify font for all unicode characters
    (cl-loop for font in '("Segoe UI Symbol" "Symbola" "Symbol")
             when (font-installed-p font)
             return (if (< emacs-major-version 27)
                        (set-fontset-font "fontset-default" 'unicode font nil 'prepend)
                      (set-fontset-font t 'symbol (font-spec :family font) nil 'prepend)))

    ;; Emoji
    (cl-loop for font in '("Noto Color Emoji" "Apple Color Emoji" "Segoe UI Emoji")
             when (font-installed-p font)
             return (cond
                     ((< emacs-major-version 27)
                      (set-fontset-font "fontset-default" 'unicode font nil 'prepend))
                     ((< emacs-major-version 28)
                      (set-fontset-font t 'symbol (font-spec :family font) nil 'prepend))
                     (t
                      (set-fontset-font t 'emoji (font-spec :family font) nil 'prepend))))

    ;; Specify font for Chinese characters
    (cl-loop for font in '("KaiTi" "WenQuanYi Micro Hei" "PingFang SC" "Microsoft Yahei" "STFangsong")
             when (font-installed-p font)
             return (progn
                      (setq face-font-rescale-alist `((,font . 1.2)))
                      (set-fontset-font t '(#x4e00 . #x9fff) (font-spec :family font))))))

(xfw-setup-fonts)


(provide 'init-font)
