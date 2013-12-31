;;; 10-ensime.el --- 

;; Copyright (C) 2013  Sasaki Kai

;; Author: Sasaki Kai <sasakiumi@Sasaki-no-MacBook-Air-2.local>
;; Keywords: 

;; ensime
(add-to-list 'load-path "/Users/sasakiumi/.emacs.d/ensime/elisp/")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

