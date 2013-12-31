;; Load Path
(setq load-path (cons "/Users/sasakiumi/.emacs.d/" load-path))
(setq load-path (cons "/Users/sasakiumi/.emacs.d/site-lisp/" load-path))
(setq load-path (cons "/Users/sasakiumi/.emacs.d/site-lisp/slime/" load-path))
(setq load-path (cons "/Users/sasakiumi/.emacs.d/auto-install/" load-path))

;;設定ファイルはinits以下に置いていて、init-loaderによって読み込まれる
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")
;;(init-loader-load "~/Dropbox/config-file/.emacs.d/inits")

;; In order to use Ricty font
;;(set-face-attribute 'default nil :family "Ricty" :height 130)
;;(set-fontset-font "fontset-default" 'japanese-jisx0208 '("Ricty" . "iso10646-*"))

;; insted of using yes, I want to use "y"
(defalias 'yes-or-no-p 'y-or-n-p)

;;zencoding
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes

(require 'auto-install)
(add-to-list 'load-path auto-install-directory)
;;(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;Lighten emacs by using gc
(setq gc-cons-threshold (* 10 gc-cons-threshold))

;;If there are same name file buffer, you can clalify by showing directory.
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; Conterpart ()
(show-paren-mode 1)


;;You need not sequencial match for finding wanted buffer
(iswitchb-mode 1)
(setq read-buffer-function 'iswitchb-read-buffer)
(setq iswitchb-regexp nil)
(setq iswitchb-prompt-newbuffer nil)

;;Editting directory names
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

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

;;; Hide tool bar
;; change tool bar mode (M-x tool-bar-mode )
;;(tool-bar-mode -1)

;; show file name
(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))

;; Remove start up 
(setq inhibit-startup-message t)

;; Max key bind
;;(mac-key-mode 1)
;;(setq mac-option-modifier 'meta)


;; Indent option
(setq cssm-indent-level 4)
(setq cssm-indent-function #'cssm-c-style-indenter)

;; Auto Complete Mode
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/Users/sasakiumi/.emacs.d/site-lisp/ac-dict")
(ac-config-default)

;; フォント設定
;;(if (eq window-system 'mac) (require 'carbon-font))
;;(if window-system (fixed-width-set-fontset "hirakaku_w3" 12))
;;(if window-system (setq fixed-widthx-rescale nil))

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

;; 行番号を表示する
;; 表示切替はM-x wb-line-number-toggleと入力。
(require 'wb-line-number)
;;(setq truncate-partial-width-windows nil)
;;(set-scroll-bar-mode nil)
;;(setq wb-line-number-scroll-bar t)
;;(wb-line-number-toggle)


;; フルスクリーンモード
(defun my-mac-toggle-max-window ()
  (interactive)
  (if (frame-parameter nil 'fullscreen)
      (set-frame-parameter nil 'fullscreen nil)
    (set-frame-parameter nil 'fullscreen 'fullboth)))
(global-set-key "\C-cm" 'my-mac-toggle-max-window)
(my-mac-toggle-max-window)


;; バッテリー残量表示
;;(display-battery-mode 1)

;;時刻表示
(display-time-mode 1)


(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
;; http://8-p.info/emacs-javascript.html
(setq-default c-basic-offset 4)

;; js2-mode
(when (load "js2" t)
    (setq js2-cleanup-whitespace nil
	          js2-mirror-mode nil
		          js2-bounce-indent-flag nil)

      (defun indent-and-back-to-indentation ()
	    (interactive)
	        (indent-for-tab-command)
		    (let ((point-of-indentation
			              (save-excursion
					             (back-to-indentation)
						                  (point))))
		            (skip-chars-forward "\s " point-of-indentation)))
            (define-key js2-mode-map "\C-i" 'indent-and-back-to-indentation)
	          (define-key js2-mode-map "\C-m" nil))

;; バックアップファイルを作らない
(setq backup-inhibited t)



;;Gauche
(modify-coding-system-alist 'process "gosh" '(utf-8 . utf-8))
(setq scheme-program-name "gosh -i" )
(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)

(defun scheme-other-window()
  "Run scheme on other window"
  (interactive)
  (switch-to-buffer-other-window
   (get-buffer-create "*scheme*"))
  (run-scheme scheme-program-name))

(define-key global-map
  "\C-cs" 'scheme-other-window)

(require 'install-elisp)

(setq install-elisp-repository-directory "~/.emacs.d/site-lisp/")

;;Calling bash in emacs
(require 'multi-term)

;;Coloring mark region
(setq transient-mark-mode t)

;;Replace command was changed
(global-set-key "\C-cr" 'query-replace)

;;Modified view-mode key-binding
(require 'view)
(setq view-read-only t)
(define-key view-mode-map (kbd "h") 'backward-char)
(define-key view-mode-map (kbd "j") 'next-line)
(define-key view-mode-map (kbd "k") 'previous-line)
(define-key view-mode-map (kbd "l") 'forward-char)
(define-key view-mode-map (kbd "J") 'View-scroll-line-forward)
(define-key view-mode-map (kbd "K") 'View-scroll-line-backward)

;; If the file cannot be modified, modeline color is red, if in pager mode, color is orange
;;(require 'viewer)
;;(viewer-stay-in-setup)
;;(setq viewer-modeline-color-unwritable "tomato")
;;(setq viewer-modeline-color-view "orange")
;;(viewer-change-modeline-color-setup)

(require 'open-junk-file)
(setq open-junk-file-format "~/junk/%Y-%m-%d%H%M%S.")

(which-func-mode 1)
(setq which-func-modes t)
(delete (assoc 'which-func-mode mode-line-format) mode-line-format)
(setq-default header-line-format '(which-func-mode ("" which-func-format)))



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

;; Kill whole line including "\n"
(setq kill-whole-line t)


(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; インデントの関数の再設定
(add-hook 'js2-mode-hook
          #'(lambda ()
              (require 'js)
              (setq js-indent-level 4
                    js-expr-indent-offset 4
                    indent-tabs-mode nil)
              (set (make-local-variable 'indent-line-function) 'js-indent-line)))


(global-auto-revert-mode 1)

;; Unused buffers are removed automatically
(require 'tempbuf)
;; Trigered opening new file
(add-hook 'find-file-hooks 'turn-on-tempbuf-mode)
;;
(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)


;; Auto insert template
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/templates/")
(define-auto-insert "\\.c$" "c-template.c")
(define-auto-insert "\\.py$" "python-template.py")

;; current path files
(ffap-bindings)

(setq inferior-lisp-program "/usr/local/bin/clisp")
(require 'slime)
(slime-setup)

;;(require 'popwin)
;;(popwin-mode 1)

(global-set-key (kbd "C-h") 'delete-backward-char)


;; scala-mode
(require 'scala-mode2)
(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
(add-hook 'scala-mode-hook
  (function
    (lambda ()
      (setq scala-mode-indent:step 2)
      (scala-mode-lib:define-keys scala-mode-map
                                  ([(shift tab)]   'scala-undent-line)
                                  ([(control tab)] nil))
      (local-set-key [(return)] 'newline-and-indent))))
(add-hook 'scala-mode-hook 'jaspace-mode)

;; ensime
(add-to-list 'load-path "/Users/sasakiumi/.emacs.d/ensime/elisp/")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; Use both auto-complete and ensime
(defun my-ac-scala-mode ()
  (add-to-list 'ac-sources 'ac-source-dictionary)
  (add-to-list 'ac-sources 'ac-source-yasnippet)
  (add-to-list 'ac-sources 'ac-source-words-in-buffer)
  (add-to-list 'ac-sources 'ac-source-words-in-same-mode-buffers)
  (setq ac-sources (reverse ac-sources)) 
  )

(add-hook 'ensime-mode-hook 'my-ac-scala-mode)

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(require 'helm-config)
(helm-mode t)
