;;; 10-autocomplete.el --- 

;; Copyright (C) 2013  Sasaki Kai

;; Author: Sasaki Kai <sasakiumi@Sasaki-no-MacBook-Air-2.local>
;; Keywords: extensions, 

;; Auto Complete Mode
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/Users/sasakiumi/.emacs.d/site-lisp/ac-dict")
(ac-config-default)
