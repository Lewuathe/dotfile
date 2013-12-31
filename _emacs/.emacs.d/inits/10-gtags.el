;;; 10-gtags.el --- 

;; Copyright (C) 2013  Sasaki Kai

;; Author: Sasaki Kai <sasakiumi@Sasaki-no-MacBook-Air-2.local>
;; Keywords: extensions, 

(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
	  '(lambda ()
		 (local-set-key "\M-t" 'gtags-find-tag)
		 (local-set-key "\M-r" 'gtags-find-rtag)
		 (local-set-key "\M-s" 'gtags-find-symbol)
		 (local-set-key "\C-t" 'gtags-pop-stack)
		 ))

(add-hook 'c-mode-common-hook
		  '(lambda()
			 (gtags-mode 1)
			 (gtags-make-complete-list)
			 ))
