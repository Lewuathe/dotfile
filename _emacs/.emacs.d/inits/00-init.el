;;; 00-init.el --- 

;; Copyright (C) 2013  Sasaki Kai

;; Author: Sasaki Kai <sasakiumi@Sasaki-no-MacBook-Air-2.local>
;; Keywords: initialization

;; insted of using yes, I want to use "y"
(defalias 'yes-or-no-p 'y-or-n-p)

;;Lighten emacs by using gc
(setq gc-cons-threshold (* 10 gc-cons-threshold))

;; Conterpart ()
(show-paren-mode 1)

;;You need not sequencial match for finding wanted buffer
(iswitchb-mode 1)
(setq read-buffer-function 'iswitchb-read-buffer)
(setq iswitchb-regexp nil)
(setq iswitchb-prompt-newbuffer nil)

;;Editting directory names
;;(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; Show recent used files with command \C-xr 
(setq recentf-max-saved-items 50)
(setq recentf-exclude '("/TAGS$" "/var/tmp/"))
(require 'recentf-ext)
(global-set-key "\C-xr" 'recentf-open-files)

;; Auto saving with modifications
(require 'auto-save-buffers)
(run-with-idle-timer 2 t 'auto-save-buffers)

;; Window position and size
(if window-system (progn
  (set-background-color "Black")
  (set-foreground-color "White")
  (set-cursor-color "Gray")
))

;; Transparent Window
(add-to-list 'default-frame-alist '(alpha . (0.80 0.80)))

;; show file name
(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))

;; Remove start up 
(setq inhibit-startup-message t)

;; Indent option
(setq cssm-indent-level 4)
(setq cssm-indent-function #'cssm-c-style-indenter)

;; タブキー
(setq default-tab-width 4)
(setq indent-line-function 'indent-relative-maybe)

;; 何文字目にいるか表示
(column-number-mode 1)

;; 行カーソル
(defface hlline-face
  '((((class color)
      (background dark))
     ;;(:background "dark state gray"))
     (:background "gray10"
                  :underline "gray24"))
    (((class color)
      (background light))
     (:background "ForestGreen"
                  :underline nil))
	(t ()))
  "*Face used by hl-line.")

;;(setq hl-line-face 'underline)
(setq hl-line-face 'hlline-face)
(global-hl-line-mode 1)
(set-face-background 'hl-line "darkolivegreen")

;; full screen
(defun my-mac-toggle-max-window ()
  (interactive)
  (if (frame-parameter nil 'fullscreen)
      (set-frame-parameter nil 'fullscreen nil)
    (set-frame-parameter nil 'fullscreen 'fullboth)))
(global-set-key "\C-cm" 'my-mac-toggle-max-window)
(my-mac-toggle-max-window)

;; Don't make backup files
(setq backup-inhibited t)

(define-key global-map
  "\C-cs" 'scheme-other-window)

;;Coloring mark region
(setq transient-mark-mode t)

(global-set-key (kbd "C-h") 'delete-backward-char)

(which-func-mode 1)
(setq which-func-modes t)
(delete (assoc 'which-func-mode mode-line-format) mode-line-format)
(setq-default header-line-format '(which-func-mode ("" which-func-format)))


;; Kill whole line including "\n"
(setq kill-whole-line t)

(global-auto-revert-mode 1)

;; current path files
(ffap-bindings)

(require 'highlight-symbol)
(setq highlight-symbol-colors '("DarkOrange" "DodgerBlue1" "DeepPink1"))
;; 適宜keybindの設定
(global-set-key (kbd "C-r") 'highlight-symbol-at-point)
(global-set-key (kbd "C-M-r") 'highlight-symbol-remove-all)
