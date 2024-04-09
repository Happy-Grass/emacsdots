(require 'elfeed)
(setq elfeed-db-directory "~/.emacs.d/elfeed")
(setq elfeed-enclosure-default-dir "~/.emacs.d")
(setq elfeed-title-max-width 90)
(setq elfeed-title-min-width 90)
(setq elfeed-feeds
      '(("https://www.nature.com/nature.rss" NATURE)
	("https://rss.sciencedirect.com/publication/science/00431354" WR)
	("https://www.nature.com/natwater.rss" NW)
	)
      )
;; Automatically updating feed when opening elfeed
(add-hook 'elfeed-search-mode-hook #'elfeed-update)
(provide 'init-elfeed)
