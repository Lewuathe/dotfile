;;; 20-modes.el --- 

;; Copyright (C) 2013  Sasaki Kai

;; Author: Sasaki Kai <sasakiumi@Sasaki-no-MacBook-Air-2.local>
;; Keywords: modes

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


;; Auto insert template
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/templates/")
(define-auto-insert "\\.c$" "c-template.c")
(define-auto-insert "\\.py$" "python-template.py")

(setq inferior-lisp-program "/usr/local/bin/clisp")
(require 'slime)
(slime-setup)


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

;; Use both auto-complete and ensime
(defun my-ac-scala-mode ()
  (add-to-list 'ac-sources 'ac-source-dictionary)
  (add-to-list 'ac-sources 'ac-source-yasnippet)
  (add-to-list 'ac-sources 'ac-source-words-in-buffer)
  (add-to-list 'ac-sources 'ac-source-words-in-same-mode-buffers)
  (setq ac-sources (reverse ac-sources)) 
  )

(add-hook 'ensime-mode-hook 'my-ac-scala-mode)

