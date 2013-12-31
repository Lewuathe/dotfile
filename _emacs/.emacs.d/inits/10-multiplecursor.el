;;; 10-multiplecursor.el --- 

;; Copyright (C) 2013  Sasaki Kai

;; Author: Sasaki Kai <sasakiumi@Sasaki-no-MacBook-Air-2.local>
;; Keywords: extensions

(require 'expand-region)
(require 'multiple-cursors)
(require 'smartrep)


(global-set-key "\C-@" 'er/expand-region)

(global-set-key (kbd "C-M-l") 'mc/mark-next-like-this)
(global-set-key (kbd "C-M-o") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-M-m") 'mc/mark-all-dwim)
(global-set-key (kbd "C-M-j") 'mc/mark-more-like-this-extended)






