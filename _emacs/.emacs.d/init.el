;; Load Path
(setq load-path (cons "/Users/sasakiumi/.emacs.d/" load-path))
(setq load-path (cons "/Users/sasakiumi/.emacs.d/site-lisp/" load-path))
(setq load-path (cons "/Users/sasakiumi/.emacs.d/site-lisp/slime/" load-path))
(setq load-path (cons "/Users/sasakiumi/.emacs.d/auto-install/" load-path))


(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; init loader
(require 'init-loader)
(init-loader-load "/Users/sasakiumi/.emacs.d/inits")

















