;;; 10-autoinstall.el --- 

;; Copyright (C) 2013  Sasaki Kai

;; Author: Sasaki Kai <sasakiumi@Sasaki-no-MacBook-Air-2.local>
;; Keywords: extensions

(require 'auto-install)
(add-to-list 'load-path auto-install-directory)
;;(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)


